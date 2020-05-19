alias tf=terraform
alias tfw="terraform workspace"

tfv(){
  terraform validate -var-file=vars/$(terraform workspace show).tfvars
}

tfp(){
  terraform plan -var-file=vars/$(terraform workspace show).tfvars
}

tfa(){
  terraform apply -var-file=vars/$(terraform workspace show).tfvars
}

tfc(){
  terraform console -var-file=vars/$(terraform workspace show).tfvars
}
