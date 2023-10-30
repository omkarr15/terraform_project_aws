#how to use aws cloud by terraform

terraform {
#tfstate maintain remotely in s3 
  backend "s3"{
  	bucket = "tfbucketremotebackend"   #need to create s3 bucket and give here name it will save all the .tfstate file 
	key = "webdev/my.tfstate" #path of folder in s3 bucket
	region = "ap-south-1"
#state locking	in dynamodb
	dynamodb_table = "mytableforlocktf"      #need to create table i dynamodb in aws so it will help in state lock file
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
