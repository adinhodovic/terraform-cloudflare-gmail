module "gsuite" {
  source = "github.com/adinhodovic/terraform-cloudflare-gsuite"

  cloudflare_zone = "findwork.dev"
}
