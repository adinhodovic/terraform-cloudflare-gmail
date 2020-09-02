variable "zone_id" {
  type = string
}

variable "dmarc" {
  type    = string
  default = null
}

variable "dkim" {
  type    = string
  default = null
}

variable "spf" {
  type    = string
  default = null
}
