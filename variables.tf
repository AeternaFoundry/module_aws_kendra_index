variable "kendra_indices" {
  description = <<EOT
Map of kendra_indices, attributes below
Required:
    - name
    - role_arn
Optional:
    - description
    - edition
    - region
    - tags
    - tags_all
    - user_context_policy
    - capacity_units (block):
        - query_capacity_units (optional)
        - storage_capacity_units (optional)
    - document_metadata_configuration_updates (block):
        - name (required)
        - relevance (optional, block):
            - duration (optional)
            - freshness (optional)
            - importance (optional)
            - rank_order (optional)
            - values_importance_map (optional)
        - search (optional, block):
            - displayable (optional)
            - facetable (optional)
            - searchable (optional)
            - sortable (optional)
        - type (required)
    - server_side_encryption_configuration (block):
        - kms_key_id (optional)
    - user_group_resolution_configuration (block):
        - user_group_resolution_mode (required)
    - user_token_configurations (block):
        - json_token_type_configuration (optional, block):
            - group_attribute_field (required)
            - user_name_attribute_field (required)
        - jwt_token_type_configuration (optional, block):
            - claim_regex (optional)
            - group_attribute_field (optional)
            - issuer (optional)
            - key_location (required)
            - secrets_manager_arn (optional)
            - url (optional)
            - user_name_attribute_field (optional)
EOT

  type = map(object({
    name                = string
    role_arn            = string
    description         = optional(string)
    edition             = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    user_context_policy = optional(string)
    capacity_units = optional(object({
      query_capacity_units   = optional(number)
      storage_capacity_units = optional(number)
    }))
    document_metadata_configuration_updates = optional(list(object({
      name = string
      relevance = optional(object({
        duration              = optional(string)
        freshness             = optional(bool)
        importance            = optional(number)
        rank_order            = optional(string)
        values_importance_map = optional(map(number))
      }))
      search = optional(object({
        displayable = optional(bool)
        facetable   = optional(bool)
        searchable  = optional(bool)
        sortable    = optional(bool)
      }))
      type = string
    })))
    server_side_encryption_configuration = optional(object({
      kms_key_id = optional(string)
    }))
    user_group_resolution_configuration = optional(object({
      user_group_resolution_mode = string
    }))
    user_token_configurations = optional(object({
      json_token_type_configuration = optional(object({
        group_attribute_field     = string
        user_name_attribute_field = string
      }))
      jwt_token_type_configuration = optional(object({
        claim_regex               = optional(string)
        group_attribute_field     = optional(string)
        issuer                    = optional(string)
        key_location              = string
        secrets_manager_arn       = optional(string)
        url                       = optional(string)
        user_name_attribute_field = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.document_metadata_configuration_updates == null || (length(v.document_metadata_configuration_updates) <= 500)
      )
    ])
    error_message = "Each document_metadata_configuration_updates list must contain at most 500 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.capacity_units == null || (v.capacity_units.query_capacity_units == null || (v.capacity_units.query_capacity_units >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.capacity_units == null || (v.capacity_units.storage_capacity_units == null || (v.capacity_units.storage_capacity_units >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.document_metadata_configuration_updates == null || alltrue([for item in v.document_metadata_configuration_updates : (item.relevance == null || (item.relevance.importance == null || (item.relevance.importance >= 1 && item.relevance.importance <= 10)))])
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.user_token_configurations == null || (v.user_token_configurations.json_token_type_configuration == null || (length(v.user_token_configurations.json_token_type_configuration.group_attribute_field) >= 1 && length(v.user_token_configurations.json_token_type_configuration.group_attribute_field) <= 2048))
      )
    ])
    error_message = "must be between 1 and 2048 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.user_token_configurations == null || (v.user_token_configurations.json_token_type_configuration == null || (length(v.user_token_configurations.json_token_type_configuration.user_name_attribute_field) >= 1 && length(v.user_token_configurations.json_token_type_configuration.user_name_attribute_field) <= 2048))
      )
    ])
    error_message = "must be between 1 and 2048 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.user_token_configurations == null || (v.user_token_configurations.jwt_token_type_configuration == null || (v.user_token_configurations.jwt_token_type_configuration.claim_regex == null || (length(v.user_token_configurations.jwt_token_type_configuration.claim_regex) >= 1 && length(v.user_token_configurations.jwt_token_type_configuration.claim_regex) <= 100)))
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.user_token_configurations == null || (v.user_token_configurations.jwt_token_type_configuration == null || (v.user_token_configurations.jwt_token_type_configuration.group_attribute_field == null || (length(v.user_token_configurations.jwt_token_type_configuration.group_attribute_field) >= 1 && length(v.user_token_configurations.jwt_token_type_configuration.group_attribute_field) <= 100)))
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_indices : (
        v.user_token_configurations == null || (v.user_token_configurations.jwt_token_type_configuration == null || (v.user_token_configurations.jwt_token_type_configuration.user_name_attribute_field == null || (length(v.user_token_configurations.jwt_token_type_configuration.user_name_attribute_field) >= 1 && length(v.user_token_configurations.jwt_token_type_configuration.user_name_attribute_field) <= 100)))
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  # Note: 15 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

