provider "hcloud" {
  token = "dummy"
}

run "primary_ip_plan_offline" {
  command = plan

  plan_options {
    refresh = false
  }

  module {
    source = "./modules/primary-ip"
  }

  variables {
    create     = false
    name       = "test-primary"
    type       = "ipv4"
    datacenter = "fsn1-dc14"
  }

  assert {
    condition     = output.id == null
    error_message = "expected no primary IP to be created"
  }
}

