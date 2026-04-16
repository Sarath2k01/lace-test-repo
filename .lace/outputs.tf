output "bucket_arn" {
  value = module.bucket.arn
}
output "bucket_bucket_domain_name" {
  value = module.bucket.bucket_domain_name
}
output "bucket_bucket_regional_domain_name" {
  value = module.bucket.bucket_regional_domain_name
}
output "bucket_id" {
  value = module.bucket.id
}
output "log_group_log_group_arn" {
  value = module.log_group.log_group_arn
}
output "log_group_log_group_name" {
  value = module.log_group.log_group_name
}
output "policy_attachment_attachment_id" {
  value = module.policy_attachment.attachment_id
}
output "role_role_arn" {
  value = module.role.role_arn
}
output "role_role_name" {
  value = module.role.role_name
}
output "security_group_security_group_arn" {
  value = module.security_group.security_group_arn
}
output "security_group_security_group_id" {
  value = module.security_group.security_group_id
}
output "security_group_security_group_name" {
  value = module.security_group.security_group_name
}
output "vpc_cidr_block" {
  value = module.vpc.cidr_block
}
output "vpc_id" {
  value = module.vpc.id
}
output "vpc_internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}
output "vpc_nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}
output "vpc_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}
output "vpc_public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
