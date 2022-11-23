#
# None Dynamic Records
#

# top level record
# will be updated dynamically with right ip
resource "cloudflare_record" "top_level"{
    name = "ipv4"
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = chomp(data.http.ipv4.response_body)
    proxied = true
    type = "A"
    ttl = 1
}

resource "cloudflare_record" "cname_root" {
    name = var.cloudflare_domain_org
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "ipv4.${var.cloudflare_domain_org}"
    proxied = true
    type = "CNAME"
    ttl = 1
}

resource "cloudflare_record" "cname_www" {
    name = "www"
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "ipv4.${var.cloudflare_domain_org}"
    proxied = true
    type = "CNAME"
    ttl = 1
}

# proxmox record
resource "cloudflare_record" "pve_record" {
    name = "pve"
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "192.168.30.186"
    proxied = false
    type = "A"
    ttl = 1
}

# sendgrid
resource "cloudflare_record" "cname_sendgrid_1"{
    name = var.sendgrid_1
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "sendgrid.net"
    proxied = false
    type = "CNAME"
    ttl = 1
}

resource "cloudflare_record" "cname_sendgrid_2"{
    name = var.sendgrid_2
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "sendgrid.net"
    proxied = false
    type = "CNAME"
    ttl = 1
}

resource "cloudflare_record" "cname_sendgrid_3"{
    name = var.sendgrid_3
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = "sendgrid.net"
    proxied = false
    type = "CNAME"
    ttl = 1
}


resource "cloudflare_record" "sendgrid_domainkey_1"{
    name = "s1._domainkey"
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = var.sendgrid_s1
    proxied = false
    type = "CNAME"
    ttl = 1
}

resource "cloudflare_record" "sendgrid_domainkey_2"{
    name = "s2._domainkey"
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    value = var.sendgrid_s2
    proxied = false
    type = "CNAME"
    ttl = 1
}
