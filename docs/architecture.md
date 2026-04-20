## Architecture

This repository provides:

- The **root module** to manage Primary IPs and Floating IPs.
- Submodules for **Primary IP**, **Floating IP (with optional assignment)**, and **rDNS**.

### High-level flow

```mermaid
flowchart TB
  caller[Caller / Environment] --> root[Root module: terraform-hcloud-ip]

  root --> pim[modules/primary-ip]
  root --> fim[modules/floating-ip]

  pim --> primary[hcloud_primary_ip]

  fim --> floating[hcloud_floating_ip]
  fim --> assign[hcloud_floating_ip_assignment]

  caller -. optional .-> rdns[modules/rdns]
  rdns --> rdns_server[hcloud_rdns (server)]
  rdns --> rdns_fip[hcloud_rdns (floating_ip)]
  rdns --> rdns_pip[hcloud_rdns (primary_ip)]
  rdns --> rdns_lb[hcloud_rdns (load_balancer)]
```

