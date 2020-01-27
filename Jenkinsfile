pipeline {
  agent any
  environment {
   PATH = "${PATH}:${getTerraformPath()}"
  }

 stages {
   stage ('Create S3 Bucket') {
     steps {

       sh label: 'create s3 bucket', script: 'sudo /home/ansible/.local/bin/ansible-playbook s3-bucket.yml'
     }
   }
   stage ('terraform init and apply new-dev'){
     steps {
       sh label: 'new-dev', returnStatus: true, script: 'terraform workspace new new-dev'
       sh "terraform init"
       sh label: 'new-dev', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml'
     }
   }
   stage ('terraform init and apply new-prod'){
     steps {
       sh label: 'new-prod', returnStatus: true, script: 'terraform workspace new new-prod'
       sh "terraform init"
       sh label: 'new-prod', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml -environment app_env=prod'
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }



