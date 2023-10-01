##################################
#EC2
##################################


resource "aws_launch_template" "Sigmatek_ec2" {
  name = var.lauch_template
  image_id = var.image_id

  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Sigmatek_ec2"
    }
  }

  user_data = filebase64("${path.module}/script/webapp.sh")
}


##################################
#autoscaling group
##################################

resource "aws_autoscaling_group" "sigmatek_asg" {
  vpc_zone_identifier = [aws_subnet.Private_sigmatek_subnet_1.id, aws_subnet.Private_sigmatek_subnet_2.id]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.Sigmatek_ec2.id
    version = "$Latest"
  }
}

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "sigmatek_asg_at" {
  autoscaling_group_name = aws_autoscaling_group.sigmatek_asg.id
  elb                    = aws_lb.sigmatek_lb.id
}

##################################
#Application load balancer
##################################

resource "aws_lb" "sigmatek_lb" {
  name               = var.load_balancer
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_all.id]
  subnets            = [aws_subnet.Public_sigmatek_subnet_1.id,aws_subnet.Public_sigmatek_subnet_2.id]

  #enable_deletion_protection = true
}

#listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.sigmatek_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sigmatek_lb_tg.arn
  }
}


resource "aws_lb_target_group" "sigmatek_lb_tg" {
  name        = "sigmatek-lb-alb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.sigmatek_vpc.id
}