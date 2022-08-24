provider "aws" {
   region     = "us-east-2"
   access_key = "AKIATXUNJCEBQ7VIMUWI"
   secret_key = "QwOQEpFjINN3/5mqUwm5RiNzEWzYhBtWPLpeceyb"
   
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-051dfed8f67f095f5"
   instance_type =  var.instance_type

   tags = {
           Name = "edstem Terraform EC2"
   }
}


variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"

   validation {
    condition     = can(regex("^[Tt][2-3].(nano|micro|small)", var.instance_type))
    error_message = "Invalid Instance Type name. You can only choose - t2.nano,t2.micro,t2.small"
  }
}
