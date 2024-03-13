resource "local_file" "rke-cluster" {
  content = templatefile("cluster.tpl",
    {
      master1 = aws_instance.master1.public_ip
      master2 = aws_instance.master2.public_ip
      master3 = aws_instance.master3.public_ip
      worker1 = aws_instance.worker1.public_ip
      worker2 = aws_instance.worker2.public_ip
      worker3 = aws_instance.worker3.public_ip
      nlb     = aws_lb.rke-nlb.dns_name
    }
  )
  # Below is inventory file.
  filename = "cluster.yml"
}