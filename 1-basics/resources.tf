resource "aws_instance" "os1" {


  ami                    = var.amiId
  key_name               = "my_first_key"
  vpc_security_group_ids = ["sg-098cf9604a3c779ce"]

  #instance_type = var.instance_type["dev"]

  #another methos to give instance type using workspce concept

  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
    Name = var.osName

  }

}

resource "aws_ebs_volume" "myvol" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1
  tags = {
    Name = "mywebvol"
  }
}

resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol.id
  instance_id = aws_instance.os1.id
}

