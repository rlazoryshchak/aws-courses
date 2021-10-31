resource "aws_lb_target_group" "load_balancer_target_group" {
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
  port        = 80
  protocol    = "HTTP"

  health_check {
    port = 80
    path = "/index.html"
  }
}

resource "aws_lb_target_group_attachment" "public_attachment" {
  port             = 80
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = aws_instance.public_ec2.id
}

resource "aws_lb_target_group_attachment" "private_attachment" {
  target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  target_id        = aws_instance.private_ec2.id
  port             = 80
}

resource "aws_lb_listener" "load_balancer_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  }
}

resource "aws_lb" "load_balancer" {
  name               = "loadbalancer"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_security_group.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
}
