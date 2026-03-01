#Key Pair (login)
resource "aws_key_pair" "Deployer" {
  key_name   = "${var.Environment}infra-Key_EC2"
  public_key = file("FINAL.pub")

  tags = {
    Environment=var.Environment
  }
}


#VPC

resource "aws_default_vpc" "default" {


}


resource "aws_security_group" "security_group" {
  name        = "${var.Environment}-infra-app-sg"
  description = "This will add a security group"
  vpc_id      = aws_default_vpc.default.id #Interpolation


  

  #ingress (Inbound Rules)
  ingress  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"

  }

  
  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  #egress (Outbound Rules)
  egress {
    from_port=0
    to_port=0
    protocol=-1
    cidr_blocks=["0.0.0.0/0"]
    description="Simple Outbound Rule"
  }

}
# EC2 Instance


resource "aws_instance" "my_instance" {
    count = var.instance_count   #Meta Argument  Create 2 Instance


    depends_on = [ aws_security_group.security_group ]

    key_name = aws_key_pair.Deployer.key_name
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = var.instance_type
    ami=var.ec2_ami_id


    root_block_device {
      volume_size = var.Environment =="prd" ? 20: 10
      volume_type = "gp3"
    }


    user_data = file("install_nginx.sh")
  


  tags = {
    Name = "${var.Environment}-infra-app-ec2"
  }

}

