provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "terraform-ansible"
  public_key = file("~/.ssh/id_rsa.pub")
}
