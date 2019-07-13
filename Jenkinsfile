// Jenkinsfile
String credentialsId = 'awsCredentials'

try {
  stage('GIT checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  // Run terraform init
  stage('Terraform init') {
    node {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform-0.12.3 init'
        }
      }
    }
  }

  // Run terraform plan
  stage('Terraform plan') {
    node {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform-0.12.3 plan'
        }
      }
    }
  }

//  stage('Apply Approval Input') {
//      input 'Approve Terraform apply?'
//    }

 // if (env.BRANCH_NAME == 'master') {

    // Run terraform apply
    stage('Terraform apply') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform-0.12.3 apply -auto-approve'
          }
        }
      }
    }

    // Run terraform show
    stage('Terraform show') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform-0.12.3 show'
          }
        }
      }
    }
 // }

    // Create Packer Build json file
    stage('Create Packer Build JSON') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh 'bash create_json.sh'
          }
        }
      }
    }

   // Run Packer Build
    stage('Packer Build Image') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
           vpc_id=`aws ec2 describe-vpcs --filters "Name=tag:Name,Values=Packer_VPC" --query 'Vpcs[*].VpcId' --output text`
echo $vpc_id,
           subnet_id=`aws ec2 describe-subnets --filters "Name=tag:Name,Values=Public Subnet A" --query 'Subnets[*].SubnetId' --output text`,
            sh '/usr/local/bin/packer build -var "aws_vpc=$vpc_id" -var "aws_subnet=$subnet_id" packer_build.json'
          }
        }
      }
    }

//    stage('Destroy Approval Input') {
//      input 'Approve Terraform destroy?'
//    }

    // Run terraform destroy
    stage('Terraform destroy') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform-0.12.3 destroy -auto-approve'
          }
        }
      }
    }

  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
