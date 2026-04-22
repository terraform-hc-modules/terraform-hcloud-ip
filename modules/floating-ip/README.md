# Floating Ip

Manages Hetzner Cloud Floating IPs.

Part of [`terraform-hc-modules/ip/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just floating-ip resources.

## Usage

```hcl
module "floating-ip" {
  source = "terraform-hc-modules/ip/hcloud//modules/floating-ip"
  # version = "~> 0.1"

  # See inputs below.
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.45 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_floating_ip.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip) | resource |
| [hcloud_floating_ip_assignment.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/floating_ip_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the floating IP. | `bool` | `true` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the floating IP. | `string` | `null` | no |
| <a name="input_home_location"></a> [home\_location](#input\_home\_location) | Home location for the IP. | `string` | `"fsn1"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the floating IP. | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Server ID to assign to. | `number` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the IP (ipv4 or ipv6). | `string` | `"ipv4"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_assignment_id"></a> [assignment\_id](#output\_assignment\_id) | ID of the floating IP assignment (if created). |
| <a name="output_home_location"></a> [home\_location](#output\_home\_location) | Home location of the floating IP. |
| <a name="output_id"></a> [id](#output\_id) | ID of the floating IP. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | IP address. |
| <a name="output_name"></a> [name](#output\_name) | Name of the floating IP. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | Server ID the floating IP is assigned to (if any). |
| <a name="output_type"></a> [type](#output\_type) | Type of the floating IP (ipv4 or ipv6). |
<!-- END_TF_DOCS -->
