resource "aws_lb" "load-balancer" {
  name 			= "public-load-balancer"
  load_balancer_type	= "application"
  security_groups    	= [aws_security_group.nextcloud_sg.id]
  subnets		= [ var.public_sub_id, var.private_sub_id ] 
}

resource "aws_lb_listener" "this" {
  load_balancer_arn 	= aws_lb.load-balancer.arn
  protocol		= "HTTP"
  port			= "80"
  default_action {
    type		= "forward"
    target_group_arn	= aws_lb_target_group.nextcloud-target.arn
  }
}

resource "aws_lb_target_group" "nextcloud-target" {
  port		= "80"
  protocol 	= "HTTP"
  vpc_id	= var.vpc_id
  depends_on = [ aws_lb.load-balancer ]
}

resource "aws_lb_target_group_attachment" "nextcloud_attach" {
  target_group_arn = aws_lb_target_group.nextcloud-target.arn
  target_id        = aws_instance.nextcloud.id
  port             = 80
}

