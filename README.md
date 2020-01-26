# Terraform-Cloudflare-Gsuite Module

Module to create Gsuite records.

The following records are created:

| Rule  | Purpose                                                                                                      |
| ------|:------------------------------------------------------------------------------------------------------------:|
| MX(required)    | [Mail exchange records.](https://support.google.com/a/answer/174125?hl=en) |
| DMARC(optional) | [Specifies how your domain handles suspicious incoming emails.](https://support.google.com/a/answer/2466563) |
| DKIM(optional)  | [Verifies that message content is authentic and not changed.](https://support.google.com/a/answer/180504)    |
| SPF(optional)   | [Specifies the servers that can send email for a domain.](https://support.google.com/a/answer/33786?hl=en)   |

Example found in examples/root-example.
