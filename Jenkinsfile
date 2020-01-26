pipeline {
  agent any
  environment {
   PATH = "${PATH}:${getTerraformPath()}"
  }

 stages {
   stage ('Create S3 Bucket') {
     steps {
       script {
          creates3Bucket('kams-devops')
       }
     }
   }
   stage ('terraform init and apply -dev'){
     steps {
       sh label: 'dev', returnStatus: true, script: 'terraform workspace new dev'
       sh "terraform init"
       sh "terraform apply -var-file=dev.tfvars -auto-approve"
     }
   }
   stage ('terraform init and apply -prod'){
     steps {
       sh label: 'prod', returnStatus: true, script: 'terraform workspace new prod'
       sh "terraform init"
       sh "terraform apply -var-file=prod.tfvars -auto-approve"
     }
   }
 }
}
 def getTerraformPath(){
   def tfHome = tool name: 'terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
   return tfHome
 }

 def creates3Bucket(bucketName) {
   sh label: 'dev', returnStatus: true, script: "/home/ansible/.local/bin/aws s3 mb ${bucketName} --region=use-west-2"
 }

