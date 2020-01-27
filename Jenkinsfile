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
       sh label: 'new-dev', returnStatus: true, script: 'terraform init'
       sh label: 'new-dev', returnStatus: true, script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml'
     }
   }
   stage ('terraform init and apply new-prod'){
     steps {
       sh label: 'new-prod', returnStatus: true, script: 'terraform workspace new new-prod'
       sh label: 'new-prod', returnStatus: true, script: 'terraform init'
       sh label: 'new-prod', returnStatus: true, script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml -e app_env=new-prod'
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }



