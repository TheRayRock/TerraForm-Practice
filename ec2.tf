# key pair

resource "aws_key_pair" "my_key" {
  key_name   = "terraform-key-ec2"
  public_key = file("terraform-key-ec2.pub")
}

# vpc & security group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "this add for tf generated security group"
  vpc_id      = aws_default_vpc.default.id #interpolation syntax to get the vpc id from the default vpc resource

  #inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow ssh access form anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow http access form anywhere"

  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow ] access form anywhere"
  }

  #outbound rule

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbond"

  }

  tags = {
    Name = "automate-sg"
  }
}

# ec2 instance


resource "aws_instance" "my_instance" {

  # count = 2
  for_each = tomap({
    this_this_t3micro = "t3.micro",
    this_is_for_t4medium = "te.medium"
  })
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id
  user_data       = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_root_default_storage_size
    volume_type = "gp3"

  }
  tags = {
    Name = each.key
  }

}

