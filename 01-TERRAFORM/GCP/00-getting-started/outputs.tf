# Outputs Variables:
# -a way to organize data to be easily queried and shown back to the Terraform user.(# fora de organizar os dados para serem facilmente consultados e mostrados de volta ao usuário do Terraform.)
# -a way to tell Terraform what data is important. 

#Query: $ terraform output



output "ip" {
   value = google_compute_address.vm_static_ip.address
}
# Outputs:
# ip = {
#   "address" = "34.70.73.51"
#   "address_type" = "EXTERNAL"
#    ...
  
# Para visualizar na CLI:  $ terraform output ip 




####################
#   MODULE OUTPUTS #
####################
output "vpc_network_subnets_ips" {
   #value = module.moduleName.output
   value = module.network.subnets_ips
   
}





