variable "mx_records" {
  default = [
    {
      address  = "smtp.google.com"
      priority = 1
    },
  ]
}

data "cloudflare_zone" "default" {
  filter = {
    name = var.cloudflare_zone
  }
}

resource "cloudflare_dns_record" "gsuite_mx" {
  count    = length(var.mx_records)
  zone_id  = data.cloudflare_zone.default.zone_id
  name     = var.cloudflare_zone
  type     = "MX"
  content  = lookup(var.mx_records[count.index], "address")
  priority = lookup(var.mx_records[count.index], "priority")
  ttl      = 1
}

resource "cloudflare_dns_record" "gsuite_spf" {
  count   = var.spf != null ? 1 : 0
  zone_id = data.cloudflare_zone.default.zone_id
  name    = var.cloudflare_zone
  type    = "TXT"
  content = var.spf
  ttl     = 1
}

resource "cloudflare_dns_record" "gsuite_dkim" {
  count   = var.dkim != null ? 1 : 0
  zone_id = data.cloudflare_zone.default.zone_id
  name    = "google._domainkey"
  type    = "TXT"
  content = var.dkim
  ttl     = 1
}

resource "cloudflare_dns_record" "gsuite_dmarc" {
  count   = var.dmarc != null ? 1 : 0
  zone_id = data.cloudflare_zone.default.zone_id
  name    = "_dmarc"
  type    = "TXT"
  content = var.dmarc
  ttl     = 1
}
