services = {
  "api" : {
    address = "172.17.0.1"
    id      = "api"
    name    = "api"
    kind    = ""
    port    = 80
    meta = {}
    tags            = []
    # namespace       = null
    status          = "passing"
    node_id         = "node_a"
    node            = "foobar"
    node_address    = "192.168.10.10"
    node_datacenter = "dc1"
    node_tagged_addresses = {
      lan = "192.168.10.10"
      wan = "10.0.10.10"
    }
    node_meta = {}
  },
  "web_1" : {
    address = "172.17.0.3"
    id      = "web_1"
    name    = "web"
    kind    = ""
    port    = 5000
    meta = {}
    tags            = ["tacos"]
    # namespace       = null
    status          = "passing"
    node_id         = "node_a"
    node            = "foobar"
    node_address    = "192.168.10.10"
    node_datacenter = "dc1"
    node_tagged_addresses = {
      lan = "192.168.10.10"
      wan = "10.0.10.10"
    }
    node_meta = {
      somekey = "somevalue"
    }
  },
  "web_2" : {
    address = "172.17.0.3"
    id      = "web_2"
    name    = "web"
    kind    = ""
    port    = 5000
    meta = {}
    tags            = ["burrito"]
    # namespace       = null
    status          = "passing"
    node_id         = "node_b"
    node            = "foobarbaz"
    node_address    = "192.168.10.11"
    node_datacenter = "dc1"
    node_tagged_addresses = {
      lan = "192.168.10.11"
      wan = "10.0.10.10"
    }
    node_meta = {}
  }
}
