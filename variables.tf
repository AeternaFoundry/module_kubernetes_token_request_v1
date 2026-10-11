variable "token_request_v1s" {
  description = <<EOT
Map of token_request_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - spec (block):
        - audiences (optional)
        - bound_object_ref (optional, block):
            - api_version (optional)
            - kind (optional)
            - name (optional)
            - uid (optional)
        - expiration_seconds (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    spec = optional(object({
      audiences = optional(list(string))
      bound_object_ref = optional(object({
        api_version = optional(string)
        kind        = optional(string)
        name        = optional(string)
        uid         = optional(string)
      }))
      expiration_seconds = optional(number)
    }))
  }))
}

