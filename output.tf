#RKE Master Nodes IP Addresses
output "master-1" {
  value = aws_instance.master1.public_ip
}

output "master-2" {
  value = aws_instance.master1.public_ip
}

output "master-3" {
  value = aws_instance.master1.public_ip
}

#RKE Worker Nodes IP Addresses
output "worker-1" {
  value = aws_instance.worker1.public_ip
}

output "worker-2" {
  value = aws_instance.worker2.public_ip
}

output "worker-3" {
  value = aws_instance.worker3.public_ip
}

output "nlb" {
  value = aws_lb.rke-nlb.dns_name
}