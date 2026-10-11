resource "kubernetes_token_request_v1" "token_request_v1s" {
  for_each = var.token_request_v1s


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? [each.value.spec] : []
    content {
      audiences = spec.value.audiences
      dynamic "bound_object_ref" {
        for_each = spec.value.bound_object_ref != null ? [spec.value.bound_object_ref] : []
        content {
          api_version = bound_object_ref.value.api_version
          kind        = bound_object_ref.value.kind
          name        = bound_object_ref.value.name
          uid         = bound_object_ref.value.uid
        }
      }
      expiration_seconds = spec.value.expiration_seconds
    }
  }
}

