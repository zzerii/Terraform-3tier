resource "aws_alb" "web_alb" {
  name            = "${var.web_alb.name}"
  internal        = "${var.web_alb.internal}"
  security_groups = data.aws_security_groups.web_sg.ids
  subnets         = data.aws_subnets.web_sub.ids

  enable_deletion_protection = "${var.web_alb.enable_deletion_protection}"

  tags = {
    "Name" = "${var.web_alb.name}"
  }
}

resource "aws_alb_target_group" "web_alb_tg" {
  name     = "${var.web_alb_tg.name}"
  port     = "${var.web_alb_tg.port}"
  protocol = "${var.web_alb_tg.protocol}"
  vpc_id   = "${var.vpc_id}"


  health_check {
    interval            = "${var.web_alb_tg.interval}"
    path                = "${var.web_alb_tg.path}"
    healthy_threshold   = "${var.web_alb_tg.healthy_threshold}"
    unhealthy_threshold = "${var.web_alb_tg.unhealthy_threshold}"
  }

  tags = { "Name" = "${var.web_alb_tg.name}" }
}

resource "aws_alb_target_group_attachment" "web_alb_tg_ec2_1" {
  target_group_arn = aws_alb_target_group.web_alb_tg.arn
  target_id        = "${data.aws_instances.web_instance.ids[0]}"
  port             = 80
  
}
resource "aws_alb_target_group_attachment" "web_alb_tg_ec2_2" {
  target_group_arn = aws_alb_target_group.web_alb_tg.arn
  target_id        = "${data.aws_instances.web_instance.ids[1]}"
  port             = 80
  
}
resource "aws_alb_listener" "web_http" {
  load_balancer_arn = "${aws_alb.web_alb.arn}"
  port              = "${var.web_alb_listener.port}"
  protocol          = "${var.web_alb_listener.protocol}"

  default_action {
    target_group_arn = "${aws_alb_target_group.web_alb_tg.arn}"
    type             = "${var.web_alb_listener.type}"
  }
}