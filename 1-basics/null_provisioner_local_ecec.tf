resource "null_resource" "localexecnull" {
  triggers = {
    mytest = timestamp()
  }


  provisioner "local-exec" {

    command = "echo ${aws_instance.os1.public_ip} > local.txt"
  }


}


#for destroy time provisioner

resource "null_resource" "destroynull" {

  provisioner "local-exec" {
    when    = destroy
    command = "echo destroying.....  > destroy.txt"
  }


}