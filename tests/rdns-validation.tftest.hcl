provider "hcloud" {
  token = "dummy"
}

run "rdns_multiple_ids_fails" {
  command = plan

  module {
    source = "./modules/rdns"
  }

  variables {
    create         = true
    server_id      = 1
    floating_ip_id = 2
    ip_address     = "1.2.3.4"
    dns_ptr        = "host.example.com"
  }

  expect_failures = [
    terraform_data.validate,
  ]
}

