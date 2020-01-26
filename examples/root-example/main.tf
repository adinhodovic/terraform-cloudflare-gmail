module "gsuite" {
  source = "github.com/adinhodovic/terraform-cloudflare-gsuite"

  cloudflare_zone = "findwork.dev"
  dmarc           = "v=DMARC1; p=quarantine; pct=5; rua=mailto:adin@honeylogic.io"
  dkim            = "v=DKIM1; k=rsa; p=xyz"
  spf             = "v=spf1 include:_spf.google.com ~all" # Allow Google's spf server
}
