####
# Referencia de '/k8scloudmesh/k8s-monitoring.tf'
# usar o Prometheus para o Ambassador (/calculator-project/ambassador.yaml)
####

/*
# Ambassador deployment
data "kubectl_file_documents" "ambassador_docs" {
  content = file("${path.module}/yaml/ambassador.yaml")
}


resource "kubectl_manifest" "ambassador" {
  for_each  = data.kubectl_file_documents.ambassador_docs.manifests
  yaml_body = each.value
}

/*
  depends_on = [
    kubernetes_namespace.istio_system
  ]
}
*/
