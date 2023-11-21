resource "kubernetes_manifest" "namespace" {
  manifest = yamldecode(file("${path.module}/scripts/namespace.yaml"))
}

resource "kubernetes_manifest" "configmap" {
  depends_on = [kubernetes_manifest.namespace]
  manifest   = yamldecode(file("${path.module}/scripts/configmap.yaml"))
}

resource "kubernetes_manifest" "secret" {
  depends_on = [kubernetes_manifest.namespace]
  manifest   = yamldecode(file("${path.module}/scripts/secret.yaml"))
}

resource "kubernetes_manifest" "pvc" {
  depends_on = [kubernetes_manifest.secret]
  manifest   = yamldecode(file("${path.module}/scripts/pvc.yaml"))
}

resource "kubernetes_manifest" "statefulset" {
  depends_on = [kubernetes_manifest.pvc]
  manifest   = yamldecode(file("${path.module}/scripts/statefulset.yaml"))
}

resource "kubernetes_manifest" "service" {
  depends_on = [kubernetes_manifest.statefulset]
  manifest   = yamldecode(file("${path.module}/scripts/service.yaml"))
}