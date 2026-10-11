output "token_request_v1s_id" {
  description = "Map of id values across all token_request_v1s, keyed the same as var.token_request_v1s except keys with no id are omitted"
  value       = { for k, v in kubernetes_token_request_v1.token_request_v1s : k => v.id if v.id != null && length(v.id) > 0 }
}
output "token_request_v1s_metadata" {
  description = "Map of metadata values across all token_request_v1s, keyed the same as var.token_request_v1s except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_token_request_v1.token_request_v1s : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "token_request_v1s_spec" {
  description = "Map of spec values across all token_request_v1s, keyed the same as var.token_request_v1s except keys with no spec are omitted"
  value       = { for k, v in kubernetes_token_request_v1.token_request_v1s : k => one(v.spec) if v.spec != null && length(v.spec) > 0 }
}
output "token_request_v1s_token" {
  description = "Map of token values across all token_request_v1s, keyed the same as var.token_request_v1s except keys with no token are omitted"
  value       = { for k, v in kubernetes_token_request_v1.token_request_v1s : k => v.token if v.token != null && length(v.token) > 0 }
  sensitive   = true
}

