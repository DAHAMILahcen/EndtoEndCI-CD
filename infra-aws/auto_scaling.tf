# Create a launch template for the ASG
resource "aws_launch_template" "launch_template" {
  name_prefix   = "launch-template"
  image_id      = "ami-084568db4383264d4" 
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key_pair2.key_name
  network_interfaces {
  associate_public_ip_address = false
  security_groups             = [aws_security_group.template_sg.id] 
    }
  user_data = file("docker.sh")
  lifecycle {
    create_before_destroy = true
  }
  }


# Create an Auto Scaling Group
resource "aws_autoscaling_group" "my_asg" {
  desired_capacity    = 2
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.target_group.arn]
}
# create a pair of key for instances
resource "aws_key_pair" "key_pair2"{
  key_name   = "key_pair"
  public_key = file("~/.ssh/my-ec2-key.pub") 
}
