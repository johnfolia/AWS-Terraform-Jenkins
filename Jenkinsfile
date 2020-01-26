pipeline {
 agent any
 environment {
  PATH = "${PATH}:${getTerraformPath()}"
 }

 stages {
   stage ('terraform init and apply -dev'){
    steps {
    sh "terraform workspace new dev" label: 'dev', returnStatus: true
    sh "terraform init"
    sh "terraform apply -var-file=dev.tfvars -auto-approve"
    }
   }
   stage ('terraform init and apply -prod'){
    steps {
    sh "terraform workspace new prod" label: 'prod', returnStatus: true
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
