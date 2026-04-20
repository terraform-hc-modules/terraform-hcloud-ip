# Hetzner Cloud IP Module

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
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0
