output "kendra_indices_id" {
  description = "Map of id values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kendra_indices_arn" {
  description = "Map of arn values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "kendra_indices_capacity_units" {
  description = "Map of capacity_units values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => one(v.capacity_units) if v.capacity_units != null && length(v.capacity_units) > 0 }
}
output "kendra_indices_created_at" {
  description = "Map of created_at values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.created_at if v.created_at != null && length(v.created_at) > 0 }
}
output "kendra_indices_description" {
  description = "Map of description values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.description if v.description != null && length(v.description) > 0 }
}
output "kendra_indices_document_metadata_configuration_updates" {
  description = "Map of document_metadata_configuration_updates values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.document_metadata_configuration_updates if v.document_metadata_configuration_updates != null && length(v.document_metadata_configuration_updates) > 0 }
}
output "kendra_indices_edition" {
  description = "Map of edition values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.edition if v.edition != null && length(v.edition) > 0 }
}
output "kendra_indices_error_message" {
  description = "Map of error_message values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.error_message if v.error_message != null && length(v.error_message) > 0 }
}
output "kendra_indices_index_statistics" {
  description = "Map of index_statistics values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.index_statistics if v.index_statistics != null && length(v.index_statistics) > 0 }
}
output "kendra_indices_name" {
  description = "Map of name values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kendra_indices_region" {
  description = "Map of region values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kendra_indices_role_arn" {
  description = "Map of role_arn values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "kendra_indices_server_side_encryption_configuration" {
  description = "Map of server_side_encryption_configuration values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => one(v.server_side_encryption_configuration) if v.server_side_encryption_configuration != null && length(v.server_side_encryption_configuration) > 0 }
}
output "kendra_indices_status" {
  description = "Map of status values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.status if v.status != null && length(v.status) > 0 }
}
output "kendra_indices_tags" {
  description = "Map of tags values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kendra_indices_tags_all" {
  description = "Map of tags_all values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "kendra_indices_updated_at" {
  description = "Map of updated_at values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.updated_at if v.updated_at != null && length(v.updated_at) > 0 }
}
output "kendra_indices_user_context_policy" {
  description = "Map of user_context_policy values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => v.user_context_policy if v.user_context_policy != null && length(v.user_context_policy) > 0 }
}
output "kendra_indices_user_group_resolution_configuration" {
  description = "Map of user_group_resolution_configuration values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => one(v.user_group_resolution_configuration) if v.user_group_resolution_configuration != null && length(v.user_group_resolution_configuration) > 0 }
}
output "kendra_indices_user_token_configurations" {
  description = "Map of user_token_configurations values across all kendra_indices, keyed the same as var.kendra_indices"
  value       = { for k, v in aws_kendra_index.kendra_indices : k => one(v.user_token_configurations) if v.user_token_configurations != null && length(v.user_token_configurations) > 0 }
}

