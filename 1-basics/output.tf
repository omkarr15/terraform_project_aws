#attribute references
output "Public_Ip_web_url" {
  value = "http://${aws_instance.os1.public_ip}/index.html"
}

output "Instance_State" {
  value = aws_instance.os1.instance_state
}

output "Availability_Zone" {
  value = aws_instance.os1.availability_zone
}

output "EBS_Volume_ID" {
  value = aws_ebs_volume.myvol.id
}

output "Instance_ID" {
  value = aws_instance.os1.id
}