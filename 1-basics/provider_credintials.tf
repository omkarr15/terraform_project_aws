
#for authenticate  to aws cloud and login to aws

provider "aws" {
  region  = var.AWS_REGION
  profile = "terraformprofile"         #give your aes configuer profile name here



#or by this method give ur credentials
  #access_key = "Agfbfdxvnjvkjklhhbhfd"
  #secret_key = "xT3AKOriIZjhdjfbkdvbkjbvkjbklvbkbvZ"
}
