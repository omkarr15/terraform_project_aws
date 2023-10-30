 #managed resources using variable later we get the value with help of "var"

variable "amiId"{}

variable "osName"{}
     
variable "AWS_REGION" {}

variable "instance_type"{
	type = map
	default = {
		dev = "t2.micro"
		test = "t2.small"
		prod = "t2.large"
	}


 }	