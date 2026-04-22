# Rdns

Manages reverse DNS (PTR) entries for Hetzner Cloud IPs.

Part of [`terraform-hc-modules/ip/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just rdns resources.

## Usage

```hcl
module "rdns" {
  source = "terraform-hc-modules/ip/hcloud//modules/rdns"
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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_rdns.floating_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |
| [hcloud_rdns.load_balancer](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |
| [hcloud_rdns.primary_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |
| [hcloud_rdns.server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |
| [terraform_data.validate](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the rDNS entry. | `bool` | `true` | no |
| <a name="input_dns_ptr"></a> [dns\_ptr](#input\_dns\_ptr) | DNS pointer record. | `string` | n/a | yes |
| <a name="input_floating_ip_id"></a> [floating\_ip\_id](#input\_floating\_ip\_id) | Floating IP ID. | `number` | `null` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address to set rDNS for. | `string` | n/a | yes |
| <a name="input_load_balancer_id"></a> [load\_balancer\_id](#input\_load\_balancer\_id) | Load Balancer ID. | `number` | `null` | no |
| <a name="input_primary_ip_id"></a> [primary\_ip\_id](#input\_primary\_ip\_id) | Primary IP ID. | `number` | `null` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Server ID (mutually exclusive with other IDs). | `number` | `null` | no |
| <a name="input_strict_id_validation"></a> [strict\_id\_validation](#input\_strict\_id\_validation) | Whether to strictly validate that exactly one of server\_id, floating\_ip\_id, primary\_ip\_id, or load\_balancer\_id is set when create=true. | `bool` | `true` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_dns_ptr"></a> [dns\_ptr](#output\_dns\_ptr) | The DNS pointer record. |
<!-- END_TF_DOCS -->
