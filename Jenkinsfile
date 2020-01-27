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
   stage ('terraform init and apply -dev'){
     steps {
       sh "terraform init"
       sh label: 'dev', returnStatus: true, script: 'terraform workspace new devnew'
       sh label: 'dev', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml'
     }
   }
   stage ('terraform init and apply -prod'){
     steps {
       sh "terraform init"
       sh label: 'prod', returnStatus: true, script: 'terraform workspace new prodnew'
       sh label: 'prod', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml -environment app_env=prod'
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }



