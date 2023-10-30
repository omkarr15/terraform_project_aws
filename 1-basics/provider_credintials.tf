
#for authenticate  to aws cloud and login to aws

provider "aws" {
  region  = var.AWS_REGION
  profile = "terraformprofile"         #give your aes configuer profile name here



#or by this method give ur credentials
#create IAM user and crendential and write here
  #access_key = ""
  #secret_key = ""
}
