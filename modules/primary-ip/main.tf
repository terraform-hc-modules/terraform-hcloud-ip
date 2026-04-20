resource "hcloud_primary_ip" "this" {
  count = var.create ? 1 : 0

  name              = var.name
  type              = var.type
  assignee_type     = var.assignee_type
  assignee_id       = var.assignee_id
  datacenter        = var.datacenter
  auto_delete       = var.auto_delete
  delete_protection = var.delete_protection
  labels            = var.labels
}
