pipeline {
    // Agent Windows
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID      = "98e03152-0027-41fa-a4af-1b6b1100e212"
        ARM_TENANT_ID            = credentials('Terraform-Azure-Tenant_ID')
        ARM_CLIENT_ID            = credentials('Terraform-Azure-Client_ID')
        ARM_CLIENT_SECRET        = credentials('Terraform-Azure-Client-Secret')
        
        //name of container for storage_account_name = "terraformstorageaccount1"
        ARM_STATE_CONTAINER_NAME = "terraform-state-test1"
    }
    
    stages {
        stage ('terra-init'){
            steps {
                 bat "\"${getTerraformPath()}\\terraform\" init"               
            }
        }
        stage ('terra-destroy') {
            steps {
                bat "\"${getTerraformPath()}\\terraform\" destroy -auto-approve" 
            }
        } 
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}

