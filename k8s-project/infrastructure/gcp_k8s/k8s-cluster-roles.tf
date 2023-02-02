/*resource "kubernetes_cluster_role_binding" "ambassador" {
  metadata {
    name = "ambassador"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "ambassador"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.ambassador.metadata[0].name
    namespace = kubernetes_namespace.ambassador.id
  }
}

resource "kubernetes_cluster_role" "ambassador" {
  metadata {
    name = "ambassador"
  }

  rule {
    api_groups = [""]
    resources  = ["services"]
    verbs      = ["get", "list", "watch"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      =  ["create", "update", "patch", "get", "list", "watch"]
  }

  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get", "list", "watch"]
  }
}
*/
