# terraform-k8s/infra
Example Kubernetes application deployment and services configuration for use in Terraform Cloud for Business.

For a step-by-step overview of setting up the Intersight Service for Terraform and configuring Terraform Cloud Workspaces, please see https://cdn.intersight.com/components/an-hulk/1.0.9-749/docs/cloud/data/resources/terraform-service/en/Cisco_IST_Getting_Started_Guide.pdf

## Usage
* Fork this repository into your own GitHub account
* Create a workspace in Terraform Cloud (https://www.terraform.io/docs/cloud/workspaces/index.html)
* Select your version control workflow
* Select your GitHub account and choose your forked repository
* Go to General Settings and change the execution mode to Agent and select your agent.
* Go to Variables and add any needed variables as specified below

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.kubam_api](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_deployment.kubam_web](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_ingress.kubam](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress) | resource |
| [kubernetes_persistent_volume_claim.kubam](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_service.kubam_api](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service.kubam_web](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_cert"></a> [client\_cert](#input\_client\_cert) | k8s provider client certificate | `string` | `null` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | k8s provider client key | `string` | `null` | no |
| <a name="input_cluster_ca_cert"></a> [cluster\_ca\_cert](#input\_cluster\_ca\_cert) | k8s provider cluster ca certificate | `string` | `null` | no |
| <a name="input_config_path"></a> [config\_path](#input\_config\_path) | k8s provider config path | `string` | `null` | no |
| <a name="input_host"></a> [host](#input\_host) | k8s provider host | `string` | `"https://172.22.248.220:6443"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->