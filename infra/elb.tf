resource "aws_elb" "elb" {
  name = "elb-1a"

  subnets = [
    "${aws_subnet.vpc-public-1a.id}",
  ]

  security_groups = [
    "${aws_security_group.app.id}",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 10
    target              = "HTTP:80/"
    interval            = 30
  }

  instances = [
    "${aws_instance.app.id}",
  ]

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 500

  tags {
    Name = "elb"
  }
}
