try {
  stage('GIT checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  stage('Terraform Init') {
    node {
      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform init'
        }
      }
    }
  }
  
  stage('Terraform Plan') {
    node {
      withAWS(credentials: 'aws_creds', region: 'us-east-1') {
        ansiColor('xterm') {
          sh '/usr/local/bin/terraform plan'
        }
      }
    }
  }
  
   stage('Apply Approval Input') {
      input 'Approve Terraform apply?'

    }

    stage('Terraform apply') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform apply -auto-approve'
          }
        }
      }
    }
  
    stage('Terraform show') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh '/usr/local/bin/terraform show'
          }
        }
      }
    }
  
   stage('Run Packer Build') {
      node {
        withAWS(credentials: 'aws_creds', region: 'us-east-1') {
          ansiColor('xterm') {
            sh 'run_packer_build.sh'
          }
        }
      }
    }
  
    stage('Destroy Approval Input') {
      input 'Approve Terraform destroy?'
    }
  
    stage('Terraform destroy') {
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
}
