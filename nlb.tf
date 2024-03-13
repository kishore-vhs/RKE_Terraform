resource "aws_lb" "rke-nlb" {
  name = var.nlbName
  internal = false
  subnets = [aws_subnet.rke-public-subnet1.id,
             aws_subnet.rke-public-subnet2.id,
             aws_subnet.rke-public-subnet3.id]
  load_balancer_type = "network"
  enable_deletion_protection = false
  tags = {
    Environment = "QA"
  }
}

resource "aws_lb_target_group" "rke-TG" {
    name = var.tgName
    port = var.tfPort
    protocol = var.tgProtocol
    vpc_id = aws_vpc.rke.id
}

resource "aws_lb_target_group_attachment" "Master1" {
  target_group_arn = aws_lb_target_group.rke-TG.arn
  target_id = aws_instance.master1.id
  port = 6443
}

resource "aws_lb_target_group_attachment" "Master2" {
  target_group_arn = aws_lb_target_group.rke-TG.arn
  target_id = aws_instance.master2.id
  port = 6443
}

resource "aws_lb_target_group_attachment" "Master3" {
  target_group_arn = aws_lb_target_group.rke-TG.arn
  target_id = aws_instance.master3.id
  port = 6443
}

resource "aws_lb_listener" "rke-listener" {
  load_balancer_arn = aws_lb.rke-nlb.arn
  port = var.listenerPort
  protocol = var.listenerProtocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.rke-TG.arn
  }
}