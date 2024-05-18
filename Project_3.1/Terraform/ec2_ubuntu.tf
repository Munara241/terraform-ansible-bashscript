data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ubuntu" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  # subnet_id = 
  # availability_zone = 
  # associate_public_ip_address = false # without public_ip create the instance 
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = var.ec2_name
  }

}

output "ec2" {
  value = aws_instance.ubuntu.public_ip # print public_ids all instances
}
 
  