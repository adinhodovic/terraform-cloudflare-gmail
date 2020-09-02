variable "mx_records" {
  default = [
    {
      address  = "aspmx.l.google.com"
      priority = 1
    },
    {
      address  = "alt1.aspmx.l.google.com"
      priority = 5
    },
    {
      address  = "alt2.aspmx.l.google.com"
      priority = 5
    },
    {
      address  = "aspmx2.googlemail.com"
      priority = 10
    },
    {
      address  = "aspmx3.googlemail.com"
      priority = 10
    },
  ]
}

data "cloudflare_zones" "default" {
  filter {
    name = var.cloudflare_zone
  }
}

resource "cloudflare_record" "gsuite_mx" {
  count    = length(var.mx_records)
  zone_id  = lookup(data.cloudflare_zones.default.zones[0], "id")
  name     = var.cloudflare_zone
  type     = "MX"
  value    = lookup(var.mx_records[count.index], "address")
  priority = lookup(var.mx_records[count.index], "priority")
}

resource "cloudflare_record" "gsuite_spf" {
  count   = var.spf != null ? 1 : 0
  zone_id = lookup(data.cloudflare_zones.default.zones[0], "id")
  name    = var.cloudflare_zone
  type    = "TXT"
  value   = var.spf
}

resource "cloudflare_record" "gsuite_dkim" {
  count   = var.dkim != null ? 1 : 0
  zone_id = lookup(data.cloudflare_zones.default.zones[0], "id")
  name    = "google._domainkey"
  type    = "TXT"
  value   = var.dkim
}

resource "cloudflare_record" "gsuite_dmarc" {
  count   = var.dmarc != null ? 1 : 0
  zone_id = lookup(data.cloudflare_zones.default.zones[0], "id")
  name    = "_dmarc"
  type    = "TXT"
  value   = var.dmarc
}
