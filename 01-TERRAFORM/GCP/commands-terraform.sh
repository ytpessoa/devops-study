####GCP####

#1-https://console.cloud.google.com/
    #create project-> Project ID: 'testegeralproject'

#2-IAM & Admin: create service account
    #name:           terraform
    #email:          terraform@testegeralproject.iam.gserviceaccount.com
    #role:           project-->owner
    #create key:     terraformserviceaccount.json
    #Key ID:         8d4a6cef2f24afcb061d39f1bdb13bf8539800d1

#3- Google Provider Configuration Reference:
https://www.terraform.io/docs/providers/google/guides/provider_reference.html
#3.1Environment variable:
#only populate string-type variables. 
#export GOOGLE_CLOUD_KEYFILE_JSON={{path}}
#ou
export GOOGLE_CREDENTIALS="/home/ytallo/Desktop/COMMANDS/01-TERRAFORM/GCP/00-getting-started/terraformserviceaccount.json"
export GOOGLE_PROJECT="testegeralproject"
export GOOGLE_REGION="us-central1"
export GOOGLE_ZONE="us-central1-c"
#Add in 'bash_profile' or 'bashrc' to store my credentials across(em todas) sessions.
echo $GOOGLE_CREDENTIALS && echo $GOOGLE_PROJECT && echo $GOOGLE_REGION  && echo $GOOGLE_ZONE
$ printenv
$ printenv | grep "GOOGLE"


#4 Initialization
terraform init
# Downloading plugin for provider "google"
# provider.google: version = "~> 3.7" (colocar no provider!!!)

# 5 Creating Resources
terraform fmt
terraform validate
terraform apply

# 6 Destroy Infrastructure 
terraform destroy


#Variables
#https://www.terraform.io/docs/configuration/variables.html