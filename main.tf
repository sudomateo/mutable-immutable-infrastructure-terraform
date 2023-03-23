terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_key_pair" "app" {
  key_name   = "app"
  public_key = file("~/.ssh/id_ed25519_example.pub")
}

resource "aws_security_group" "app" {
  name        = "app"
  description = "app security group"
  vpc_id      = "vpc-1234-example"

  egress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description = ""
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0",
    ]
    description = ""
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

}

resource "aws_instance" "app" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.app.key_name

  tags = {
    "Name" = "app"
  }

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  # # Use this for immutable deployments via user data.
  # user_data = file("${path.module}/install.sh")

  # # Use the connection and provisioners below for immutatable deployments via a
  # # creation-time provisioner that's run over SSH.
  # connection {
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file("~/.ssh/id_ed25519")
  #   host        = self.public_ip
  # }

  # provisioner "file" {
  #   source      = "${path.module}/install.sh"
  #   destination = "/tmp/install.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/install.sh",
  #     "/tmp/install.sh",
  #     "rm /tmp/install.sh",
  #   ]
  # }
}

output "app_url" {
  value = "http://${aws_instance.app.public_ip}"
}
