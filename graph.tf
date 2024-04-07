resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "1cde0668-3aaf-40d2-88d2-ed890cdb7a06"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "d8a70b17-69b6-4d25-af1c-b8751f888fc2"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "1da68870-204c-45e4-8443-5b5186b3d533"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "85903a68-04d5-4a95-9021-4ea8dddc8dc9"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "c4172dd3-be12-40c8-a44f-10f3a2b8522d"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "48bcbdb4-9b7d-4ff1-987a-3fc12a9df4f7"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "6242fa6a-c96d-42b2-a812-179016ad904d"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
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

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
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

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "a86823c1-71d9-4981-bf2b-c91013fedac2"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "b261c079-9ed4-48a2-8d49-65a2e3c6bdeb"
  }
}