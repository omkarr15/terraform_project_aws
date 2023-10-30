#need to run terraform init -upgrade

resource "null_resource" "sshnull" {

  #forces replacement :everytime
  triggers = {
    mytest = timestamp()
  }
  connection {
    type = "ssh"
    user = "ec2-user"
#need to give path where your private key downloaded
    private_key = file("path_private_key")
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
