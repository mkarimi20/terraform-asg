module "asg_module"{
source = "./asg_module"

image_owner = "137112412989"
max_size    = 2
min_size    = 1
region      = "us-east-1"
desired_capacity = 1

}