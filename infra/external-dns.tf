module "external-dns" {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "tools"
  repository = "https://charts.bitnami.com/bitnami"

  app = {
    name             = "external-dns"
    chart            = "external-dns"
    deploy           = 1
    version          = "6.36.1"
    force_update     = true
    wait             = false
    recreate_pods    = false
    create_namespace = true
  }
  set = [
    {
      name  = "aws.regions"
      value = "us-east-1"
    }
  ]
  values = [file("./manifests/external-dns.yaml")]
}