output "hashmap" {
  value = local.shit
}

output "env" {
  value = local.iam_environment
}

output "maps" {
  value = merge(local.services, { other_map = local.other_map })
  #value = {for k,v in merge(local.services.keys, local.other_map) : k => v}
}

output "services" {
  value = merge(local.services, { other_map = local.other_map })
  #value = {for k,v in merge(local.services.keys, local.other_map) : k => v}
}
