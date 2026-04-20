## Floating IP move (document-only)

Hetzner Floating IPs can be (re)assigned between servers. This module supports assignment via `modules/floating-ip` using `server_id`.

### Typical flow

- Create a Floating IP without assignment (or with an initial assignment).
- When you need to move it to another server, update `server_id` to the new server ID and apply.

### Notes

- Moving a Floating IP is an operational action; apply will update the assignment.
- In production, consider doing moves during a maintenance window and ensure your application is tolerant of IP cutover.

