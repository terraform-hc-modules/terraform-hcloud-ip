provider "hcloud" {
  token = "dummy"
}

run "floating_ip_plan_offline" {
  command = plan

  plan_options {
    refresh = false
  }

  module {
    source = "./modules/floating-ip"
  }

  variables {
    create        = false
    name          = "test-floating"
    type          = "ipv4"
    home_location = "fsn1"
    server_id     = null
  }

  assert {
    condition     = output.id == null
    error_message = "expected no floating IP to be created"
  }
}

