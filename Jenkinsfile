#!groovy

try {
  stage('GIT Checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }
  
  stage('Build Custom Nginx Container') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh 'bash ./build_nginx_container.sh ecrrepo001 nginx-dhmf 522939339121.dkr.ecr.us-east-1.amazonaws.com'
          }
        }
      }
    }
  
  stage('Deploy Amazon VPC') {
    node {
      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform init'
          sh '/usr/local/bin/terraform plan'
          sh '/usr/local/bin/terraform apply -auto-approve'
        }
      }
    }
  }
  
//  stage('Terraform Plan') {
//   node {
//      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
//        ansiColor('xterm') {
//          sh '/usr/local/bin/terraform plan'
//        }
//      }
//    }
//  }
  
//   stage('Apply Approval Input') {
//     input 'Approve Terraform apply?'
//    }

//  stage('Terraform Apply') {
//    node {
//      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
//        ansiColor('xterm') {
//          sh '/usr/local/bin/terraform apply -auto-approve'
//        }
//      }
//    }   
 // }
  
//    stage('Terraform Show') {
//      node {
//        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
//          ansiColor('xterm') {
//            sh '/usr/local/bin/terraform show'
//          }
//        }
//      }
//    }
  
   stage('Build Custom Docker AMI') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh 'bash ./run_packer_build.sh'
          }
        }
      }
    }
  
//    stage('Destroy Approval Input') {
//      input 'Approve Terraform destroy?'
//    }
  
    stage('Destroy Amazon VPC') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform destroy -auto-approve'
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
