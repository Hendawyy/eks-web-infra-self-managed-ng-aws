resource "null_resource" "deploy_app" {
  depends_on = [helm_release.nginx_ingress]

  provisioner "local-exec" {
    command = "bash ${path.module}/Scripts/deploy-app.sh"
  }
}
