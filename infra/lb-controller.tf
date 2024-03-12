module "lb-controller" {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "aws-lb-controller"
  repository = "https://aws.github.io/eks-charts"

  app = {
    name          = "aws-load-balancer-controller"
    chart         = "aws-load-balancer-controller"
    deploy        = 1
    version       = "1.7.1"
    force_update  = true
    wait          = false
    recreate_pods = false
  }
  values = [file("./manifests/lb-controller.yaml")]

  set = [
    {
      name  = "clusterName"
      value = "eks-KIUChallenge-dev"
    }
  ]

}