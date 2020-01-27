pipeline {
  agent any
  environment {
   PATH = "${PATH}:${getTerraformPath()}"
  }

 stages {
   stage ('Create S3 Bucket') {
     steps {
       sh label: 'create s3 bucket', script: '/usr/local/bin/ansible-playbook s3-bucket.yml'
     }
   }
   stage ('terraform init and apply -dev'){
     steps {
       sh label: 'dev', returnStatus: true, script: 'terraform workspace new dev'
       sh "terraform init"
       sh label: 'dev', script: '/usr/local/bin/ansible-playbook terraform.yml'
     }
   }
   stage ('terraform init and apply -prod'){
     steps {
       sh label: 'prod', returnStatus: true, script: 'terraform workspace new prod'
       sh "terraform init"
       sh label: 'prod', script: '/usr/local/bin/ansible-playbook terraform.yml -environment app_env=prod'
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }



