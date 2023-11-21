# MariaDB Kubernetes Deployment

This Terraform module deploys a MariaDB database on a Kubernetes cluster.

## Resources

The following resources are created by this module:

- **Namespace**: A Kubernetes namespace to isolate the MariaDB related resources.
- **ConfigMap**: A Kubernetes ConfigMap to hold configuration details that can be consumed by the pods.
- **Secret**: A Kubernetes Secret to securely store sensitive information like database credentials.
- **PersistentVolumeClaim (PVC)**: A PVC to request storage space where the database data will be stored persistently.
- **StatefulSet**: A Kubernetes StatefulSet to manage the deployment and scaling of a set of Pods, and to provide guarantees about the ordering and uniqueness of these Pods.
- **Service**: A Kubernetes Service to provide a single, constant point of entry to the MariaDB StatefulSet.

## Usage

To use this module, you need to provide the path to the YAML files for each resource. These files are decoded using the `yamldecode` function and passed to the `kubernetes_manifest` resource.

The resources are created in a specific order to satisfy dependencies between them. For example, the namespace is created first because other resources are created within this namespace. The PVC depends on the secret because it might need to use some information from the secret, and so on.

### Terraform Commands

After setting up your Terraform files, navigate to the directory containing them and run the following commands:

1. **Initialization** - Download necessary providers and modules:

```bash
terraform init
```
2. **Plan** - See the changes that will be applied:

```bash
terraform plan
```

3. **Apply** - Apply the desired changes:

```bash
terraform apply
```