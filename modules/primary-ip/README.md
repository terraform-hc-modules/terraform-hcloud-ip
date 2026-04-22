# Primary Ip

Manages Hetzner Cloud Primary IPs.

Part of [`terraform-hc-modules/ip/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just primary-ip resources.

## Usage

```hcl
module "primary-ip" {
  source = "terraform-hc-modules/ip/hcloud//modules/primary-ip"
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
| [hcloud_primary_ip.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_assignee_id"></a> [assignee\_id](#input\_assignee\_id) | ID of the assignee. | `number` | `null` | no |
| <a name="input_assignee_type"></a> [assignee\_type](#input\_assignee\_type) | Type of the assignee (server). | `string` | `"server"` | no |
| <a name="input_auto_delete"></a> [auto\_delete](#input\_auto\_delete) | Auto delete when assignee is deleted. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the primary IP. | `bool` | `true` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | Datacenter for the IP. | `string` | `null` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the primary IP. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Type of the IP (ipv4 or ipv6). | `string` | `"ipv4"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_assignee_id"></a> [assignee\_id](#output\_assignee\_id) | Assignee ID. |
| <a name="output_assignee_type"></a> [assignee\_type](#output\_assignee\_type) | Assignee type. |
| <a name="output_datacenter"></a> [datacenter](#output\_datacenter) | Datacenter name. |
| <a name="output_id"></a> [id](#output\_id) | ID of the primary IP. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | IP address. |
| <a name="output_name"></a> [name](#output\_name) | Name of the primary IP. |
| <a name="output_type"></a> [type](#output\_type) | Type of the primary IP (ipv4 or ipv6). |
<!-- END_TF_DOCS -->
