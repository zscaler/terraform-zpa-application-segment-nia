locals {
  consul_services = {
    for id, s in var.services : s.name => s... if s.status == "passing"
  }
  tcp_port_ranges = {
    for id, s in var.services : s.port => s... if s.status == "passing"
  }
  udp_port_ranges = {
    for id, s in var.services : s.port => s... if s.status == "passing"
  }
}