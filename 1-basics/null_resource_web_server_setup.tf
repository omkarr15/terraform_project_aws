#need to run terraform init -upgrade

resource "null_resource" "sshnull" {

  #forces replacement :everytime
  triggers = {
    mytest = timestamp()
  }
  connection {
    type = "ssh"
    user = "ec2-user"

    private_key = file("C:/Users/Omkar/Downloads/my_first_key.pem")
    host        = aws_instance.os1.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd --now"
    ]
  }

  #meta arguments
  depends_on = [
    aws_instance.os1
  ]
}