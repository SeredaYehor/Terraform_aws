resource "aws_lb" "load-balancer" {
  count                 = var.vpn_mode == "false" ? 1 : 0
  name 			= "public-load-balancer"
  load_balancer_type	= "application"
  security_groups    	= [ aws_security_group.lb-sg.id, aws_security_group.nextcloud_sg.id ]
  subnets		= [ var.public_sub_id, var.private_sub_id ] 
}

resource "aws_lb_listener" "this" {
  count                 = var.vpn_mode == "false" ? 1 : 0
  load_balancer_arn 	= aws_lb.load-balancer[count.index].arn
  protocol		= "HTTPS"
  port			= "443"
  certificate_arn       = var.certificate

  default_action {
    type		= "forward"
    target_group_arn	= aws_lb_target_group.nextcloud-target[count.index].arn
  }
}

resource "aws_lb_target_group" "nextcloud-target" {
  count         = var.vpn_mode == "false" ? 1 : 0
  port		= "80"
  protocol 	= "HTTP"
  vpc_id	= var.vpc_id
  depends_on = [ aws_lb.load-balancer ]

  health_check {
    matcher  = "200,400,302"
  }
}

resource "aws_lb_target_group_attachment" "nextcloud_attach" {
  count                 = var.vpn_mode == "false" ? 1 : 0
  target_group_arn = aws_lb_target_group.nextcloud-target[count.index].arn
  target_id        = var.nextcloud_id
  port             = 80
}

resource "aws_lb_listener" "redirect" {
  count                 = var.vpn_mode == "false" ? 1 : 0
  load_balancer_arn = aws_lb.load-balancer[count.index].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
