resource "aws_key_pair" "us-east-1" {
  key_name   = "asg-key-pair-"
  region     = "${var.region}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}