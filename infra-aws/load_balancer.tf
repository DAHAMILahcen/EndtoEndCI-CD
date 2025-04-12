# cree un security group pour le load balancer 
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.myvpc.id
  name   = "alb_sg"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  # Limiter l'accès HTTP (port 80) à partir de n'importe où
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "load_balancer" {
  name               = "load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]

  tags = {
    description = "create a load balancer to  distribute the traffic between the instances in the private subnets" 
  }
}
resource "aws_lb_target_group" "target_group" {
  name = "target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.myvpc.id
  health_check {
    path = "/"
    port = "80"
    protocol = "HTTP"
    timeout = 5
    interval = 30
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}


### set the listener for the load balancer to listen on port 80 (http) and forward the traffic to the target group
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}