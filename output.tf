output "ec2s_public_ips" {
  value = { for instance in keys(module.ec2_instance) : instance => tostring(module.ec2_instance[instance].public_ip) }
}

output "key_pairs_pem" {
  value     = { for key in keys(module.key_pair) : key => module.key_pair[key].private_key_pem }
  sensitive = true
}