resource "aws_launch_configuration" "as_launch_conf" {
  name = "web_conf"
  image_id = "${data.aws.image.id}"
  instance_type = "t2.micro"  
  user_data = "${file("wordpress.sh")}"
}


resource "aws.aws_autoscaling_group" "bar" {
    name = "terraform_asg"
    launch_configuration = "${aws_launch_configuration.as_launch_conf}"
    availiblity_zone = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1c"
    ] 
    min_size = 1
    max_size = 1
      
lifecycle {
  create_before_destroy = true
}
  
}
