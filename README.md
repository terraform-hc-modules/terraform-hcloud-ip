# Hetzner Cloud IP Module

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0-blueviolet)](https://www.terraform.io/)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-ip/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-ip/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/terraform-hc-modules/terraform-hcloud-ip)](https://github.com/terraform-hc-modules/terraform-hcloud-ip/releases)


Terraform module for IP management on Hetzner Cloud including Primary IP, Floating IP, and rDNS.

## Usage

```hcl
module "ip" {
  source  = "terraform-hc-modules/ip/hcloud"
  version = "~> 0.1"

  name = "my-ip"

  create_primary_ip = true
  primary_ip_type   = "ipv4"

  create_floating_ip = true
  home_location      = "fsn1"
}
```

## Submodules

| Module | Description |
|--------|-------------|
| [primary-ip](modules/primary-ip) | Primary IPv4/IPv6 |
| [floating-ip](modules/floating-ip) | Floating IP with assignment |
| [rdns](modules/rdns) | Reverse DNS |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_floating_ip"></a> [floating\_ip](#module\_floating\_ip) | ./modules/floating-ip | n/a |
| <a name="module_primary_ip"></a> [primary\_ip](#module\_primary\_ip) | ./modules/primary-ip | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_auto_delete"></a> [auto\_delete](#input\_auto\_delete) | Auto delete primary IP. | `bool` | `false` | no |
| <a name="input_create_floating_ip"></a> [create\_floating\_ip](#input\_create\_floating\_ip) | Whether to create a floating IP. | `bool` | `false` | no |
| <a name="input_create_primary_ip"></a> [create\_primary\_ip](#input\_create\_primary\_ip) | Whether to create a primary IP. | `bool` | `false` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | Datacenter for primary IP. | `string` | `null` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection. | `bool` | `false` | no |
| <a name="input_floating_ip_name"></a> [floating\_ip\_name](#input\_floating\_ip\_name) | Name of the floating IP. | `string` | `null` | no |
| <a name="input_floating_ip_server_id"></a> [floating\_ip\_server\_id](#input\_floating\_ip\_server\_id) | Server ID to assign floating IP to. | `number` | `null` | no |
| <a name="input_floating_ip_type"></a> [floating\_ip\_type](#input\_floating\_ip\_type) | Type of floating IP. | `string` | `"ipv4"` | no |
| <a name="input_home_location"></a> [home\_location](#input\_home\_location) | Home location for floating IP. | `string` | `"fsn1"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name prefix for resources. | `string` | n/a | yes |
| <a name="input_primary_ip_name"></a> [primary\_ip\_name](#input\_primary\_ip\_name) | Name of the primary IP. | `string` | `null` | no |
| <a name="input_primary_ip_type"></a> [primary\_ip\_type](#input\_primary\_ip\_type) | Type of primary IP. | `string` | `"ipv4"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_floating_ip_address"></a> [floating\_ip\_address](#output\_floating\_ip\_address) | Floating IP address. |
| <a name="output_floating_ip_id"></a> [floating\_ip\_id](#output\_floating\_ip\_id) | ID of the floating IP. |
| <a name="output_primary_ip_address"></a> [primary\_ip\_address](#output\_primary\_ip\_address) | Primary IP address. |
| <a name="output_primary_ip_id"></a> [primary\_ip\_id](#output\_primary\_ip\_id) | ID of the primary IP. |
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0
