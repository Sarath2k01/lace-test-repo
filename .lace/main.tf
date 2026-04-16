module "bucket" {
  source = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/s3/bucket?ref=9451c7cffba19f0d891dd19212e0e5c54b4d6ab0"
  bucket = "demo-testing-artifacts-sarath-20260416"
}
module "log_group" {
  source            = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/cloudwatch/log_group?ref=7786a6b944ff99c1f5e848f327f6512416c710aa"
  name              = "/demo-testing/app"
  retention_in_days = 7
}
module "policy_attachment" {
  source     = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/iam/policy_attachment?ref=ff52f65e7bf0feda762574ae1609231a25c852f3"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role_name  = module.role.role_name
}
module "role" {
  source             = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/iam/role?ref=254a248d30bd941f8c2f2b1c54707f50a9a67493"
  assume_role_policy = jsonencode({ Version = "2012-10-17", Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }] })
  name               = "demo-testing-app-role"
}
module "security_group" {
  source        = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/ec2/security_group?ref=7786a6b944ff99c1f5e848f327f6512416c710aa"
  ingress_rules = [{ from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "HTTP" }]
  name          = "demo-testing-web-sg"
  vpc_id        = module.vpc.id
}
module "vpc" {
  source               = "git::https://github.com/lace-cloud/registry-tf.git//modules/aws/vpc?ref=9451c7cffba19f0d891dd19212e0e5c54b4d6ab0"
  cidr_block           = "10.0.0.0/16"
  enable_nat_gateway   = false
  name                 = "demo-testing"
  private_subnet_count = 2
  public_subnet_count  = 2
}
