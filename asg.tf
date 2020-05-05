resource "aws_launch_configuration" "as_conf" {
  name = "web_conf"
  image_id = "${data.aws_ami.image.id}"
  instance_type = "t2.micro"
  user_data = "${file("wordpress.sh")}"
}


resource "aws.aws_autoscaling_group" "someone" {
    name = "terraform_asg"
    launch_configuration = "${aws_launch_configuration.as_conf.name}"

    availability_zones = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1c",
    ] 
    min_size = 1
    max_size = 2
      
lifecycle {
  create_before_destroy = true
}
  
}
