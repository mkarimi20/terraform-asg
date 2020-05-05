resource "aws_key_pair" "us-east-1-mine" {
  key_name   = "asg-key-pair-mine"
  region     = "${var.region}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}