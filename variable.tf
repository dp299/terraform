variable "aws_instance" {
    default = "t2.micro"
    type = string
  
}
  
  variable "root_block_device" {
    default = 10
    type = number
    
  } 

  variable "aws_ami_id" {
    default = "ami-09e6f87a47903347c"
    type = string
    
  }