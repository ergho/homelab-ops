resource "cloudflare_page_rule" "jellyfin_bypass_cache" {
    zone_id = lookup(data.cloudflare_zones.domain_org.zones[0], "id")
    target = "jellyfin.${var.cloudflare_domain_org}/*"
    status = "active"
    priority = 1

    actions {
        cache_level = "bypass"
    }
}
