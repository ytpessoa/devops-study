/*

Variables => parameterize the configurations
Ler!! => https://www.terraform.io/docs/configuration/variables.html

***type number:

variable "web_instance_count" {
  type    = number
  default = 1
 }

****type list:
==============variables.tf===========================
variable "cidrs" { default = [] }   # Either(tanto faz) implicitly by using a default value of empty brackets:
variable "cidrs" { type = list }    # Or explicitly by specifying the type:
=====================================================

You can specify list values in a tfvars file as well:
==============terraform.tfvars===============
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
=============================================

***type Map: lookup tables(tabela de pesquisa)


*/



variable "project" { 
    default = "testegeralproject"    
}

variable "credentials_file" {
    #sem default, o console pede na hora do "terraform apply"
    default = "~/Desktop/COMMANDS/01-TERRAFORM/GCP/00-getting-started/terraformserviceaccount.json"
}

variable "region" { 
    default = "us-central1"
}

variable "zone" { 
    default="us-central1-c"

}



#List:
variable "cidrs" { default = [] } #Either
#variable "cidrs" { type = list } #Or

#Maps:
variable "environment" {
    type = string
    default = "dev"  
}

variable "machine_types" {
    type = map
    default={
        "dev" =   "f1-micro"
        "test" =  "n1-highcpu-32"
        "prod" =  "n1-highcpu-32"
    }

}











