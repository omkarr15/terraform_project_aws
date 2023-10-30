#how to use aws cloud by terraform

terraform {
#tfstate maintain remotely in s3 
  backend "s3"{
  	bucket = "tfbucketremotebackend"
	key = "webdev/my.tfstate"
	region = "ap-south-1"
#state locking	in dynamodb
	dynamodb_table = "mytableforlocktf"
   }
  	
	
  #terraform.exe version
  
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16"

    }
  }
}