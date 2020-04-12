
/*
  export GOOGLE_CREDENTIALS="~/Desktop/COMMANDS/01-TERRAFORM/GCP/00-getting-started/terraformserviceaccount.json"
  export GOOGLE_PROJECT="testegeralproject"
  export GOOGLE_REGION="us-central1"
  export GOOGLE_ZONE="us-central1-c"
  #Add in 'bash_profile' or 'bashrc' to store my credentials across(em todas) sessions.
 echo $GOOGLE_CREDENTIALS && echo $GOOGLE_PROJECT && echo $GOOGLE_REGION  && echo $GOOGLE_ZONE

*/


/* ****terragrunt****

  terraform {
    backend "gcs" {}
  }
*/


#Remote state  just with Terraform
  #a) create bucket(storage of the objects) in GCS:   
  #b)Diretrizes para nomeação de intervalos e objetos: https://cloud.google.com/storage/docs/naming#requirements
  #c)Permissões IAM para a Service Account escrever no bucket GCS
  #d) Como configurar a autenticação em aplicativos de produção de servidor para servidor: https://cloud.google.com/docs/authentication/production
terraform {
  backend "gcs" {
    bucket  = "bucket-remote-state"
    prefix  = "terraform-getting-started/state" #GCS prefix inside the bucket. 
  }
}


provider "google" {
  version = "~> 3.7" #depois do primeiro "terraform init"  
  #todas configuradas via variáveis de ambiente
  #ou
  #file variables.tf
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}



####################
# Part 2: MODULE   #
####################

# New VPC Network in GCP: https://registry.terraform.io/modules/terraform-google-modules/network/google/1.1.0
module "network" {
  
  source  = "terraform-google-modules/network/google" #the only mandatory argument for all modules. 
  version = "1.1.0"

  network_name = "vpc-network-of-the-module"
  project_id   = var.project

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = var.cidrs[0]
      subnet_region = var.region
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = var.cidrs[1]
      subnet_region = var.region

      subnet_private_access = "true"
    },
  ]

  secondary_ranges = {
    subnet-01 = []
    subnet-02 = []
  }
}



# instance(VM) 
resource "google_compute_instance" "vm_instance" {
      
      name         = "terraform-instance"
      #machine_type = "f1-micro"
      machine_type = var.machine_types[var.environment]
      tags         = ["web", "dev"]

      provisioner "local-exec"{
        command = "echo ${google_compute_instance.vm_instance.name}: ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip}  >> ip_address.txt"
      }

      boot_disk {
        initialize_params {

            image = "cos-cloud/cos-stable"
        }
      }
      network_interface {
          #Module Outputs of the "network": https://registry.terraform.io/modules/terraform-google-modules/network/google/1.1.0?tab=outputs
          #network = module.nameModule.output
          network = module.network.network_name
          subnetwork = module.network.subnets_names[0]
              
          access_config {        
            nat_ip = google_compute_address.vm_static_ip.address 
            #implicit dependency: "google_compute_instance" --> depois: "google_compute_address"      
          }
              
      }
}


#Assigning a Static IP Address:
resource "google_compute_address" "vm_static_ip" {
  #ID = google_compute_address.vm_static_ip
  name = "terraform-static-ip"
}


