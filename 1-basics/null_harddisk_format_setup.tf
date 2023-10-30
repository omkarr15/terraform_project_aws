#need to run terraform init -upgrade

resource "null_resource" "volumeformatnull" {



  connection {
    type = "ssh"
    user = "ec2-user"

    private_key = file("<privatekey_path>")
    host        = aws_instance.os1.public_ip
  }


  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo mount /dev/xvdh /var/www/html",
      "sudo sh -c 'echo welcome to my site..terraform ..working.. > /var/www/html/index.html'"
    ]
  }

  #meta arguments
  depends_on = [
    aws_volume_attachment.my_ebs_attach_ec2, null_resource.sshnull
  ]
}
