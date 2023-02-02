resource "kubernetes_ingress" "calculator_ingress" {
  metadata {
    name = "calculator-ingress"
  }

  spec {

    // Default backend
    backend {
      service_name = "vuecalc-svc"
      service_port = 80
    }

    rule {
      http {
        path {
          backend {
            service_name = "express-svc"
            service_port = 3000
          }

          path = "/api/express/*"
        }
      }
    }
  }
}

# Display load balancer IP (typically present in GCP, or using Nginx ingress controller)
output "load_balancer_ip" {
  value = kubernetes_ingress.calculator_ingress.status.0.load_balancer.0.ingress.0.ip
}
