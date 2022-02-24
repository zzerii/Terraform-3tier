resource "aws_alb" "was_alb" {
  name            = "${var.was_alb.name}"
  internal        = "${var.was_alb.internal}"
  security_groups = data.aws_security_groups.was_sg.ids
  subnets         = data.aws_subnets.was_sub.ids

  enable_deletion_protection = "${var.was_alb.enable_deletion_protection}"

 
  tags = {
    "Name" = "${var.was_alb.name}"
  }
}

resource "aws_alb_target_group" "was_alb_tg" {
  name     = "${var.was_alb_tg.name}"
  port     = "${var.was_alb_tg.port}"
  protocol = "${var.was_alb_tg.protocol}"
  vpc_id   = "${var.vpc_id}"

  health_check {
    interval            = "${var.was_alb_tg.interval}"
    path                = "${var.was_alb_tg.path}"
    healthy_threshold   = "${var.was_alb_tg.healthy_threshold}"
    unhealthy_threshold = "${var.was_alb_tg.unhealthy_threshold}"
  }

  tags = { Name = "${var.was_alb_tg.name}" }
}
resource "aws_alb_target_group_attachment" "was_alb_tg_ec2_0" {
  target_group_arn = aws_alb_target_group.was_alb_tg.arn
  target_id       = "${var.was_alb_tg.target_id[0]}"
  port             = 80
  
}
resource "aws_alb_target_group_attachment" "was_alb_tg_ec2_1" {
  target_group_arn = aws_alb_target_group.was_alb_tg.arn
  target_id       = "${var.was_alb_tg.target_id[1]}"
  port             = 80
  
}


resource "aws_alb_listener" "was_http" {
  load_balancer_arn = "${aws_alb.was_alb.arn}"
  port              = "${var.was_alb_listener.port}"
  protocol          = "${var.was_alb_listener.protocol}"

  default_action {
    target_group_arn = "${aws_alb_target_group.was_alb_tg.arn}"
    type             = "${var.was_alb_listener.type}"
  }
}