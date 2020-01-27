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
   stage ('terraform init and apply -newdev'){
     steps {
       sh "terraform init"
       sh label: 'newdev', returnStatus: true, script: 'terraform workspace new newdev'
       sh label: 'newdev', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml'
     }
   }
   stage ('terraform init and apply -newprod'){
     steps {
       sh "terraform init"
       sh label: 'newprod', returnStatus: true, script: 'terraform workspace new newprod'
       sh label: 'newprod', script: 'sudo /home/ansible/.local/bin/ansible-playbook terraform.yml -environment app_env=prod'
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }



