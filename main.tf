resource "aws_key_pair" "mykey" {
    key_name = "keykey"
    public_key = file("terra-key-gen.pub")
}

resource "aws_default_vpc" "myvpc" {
     
}

resource aws_security_group mysg{ 
    name = "mysgroup"
    description = "this will add forn ssh"
    vpc_id = aws_default_vpc.myvpc.id
  


   ingress {
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]

   }

 ingress {
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]

 }

}

 resource "aws_instance" "my_instance" { 
    key_name = aws_key_pair.mykey.key_name
    security_groups = [aws_security_group.mysg.name]
    instance_type = var.aws_instance
    ami = var.aws_ami_id
    user_data = file("nginx.sh")

    root_block_device {
      volume_size = var.root_block_device
      volume_type = "gp3"
    }

    tags = {
       Name = "instance" 
       Env = "Prod"
    }
 }

