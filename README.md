# Terraform-Cloudflare-Gsuite Module

Module to create Gsuite records.

The following records are created:

| Rule  | Purpose                                                                                                      |
| ------|:------------------------------------------------------------------------------------------------------------:|
| MX    | [Mail exchange records.](https://support.google.com/a/answer/174125?hl=en) |
| DMARC | [Specifies how your domain handles suspicious incoming emails.](https://support.google.com/a/answer/2466563) |
| DKIM  | [Verifies that message content is authentic and not changed.](https://support.google.com/a/answer/180504)    |
| SPF   | [Specifies the servers that can send email for a domain.](https://support.google.com/a/answer/33786?hl=en)   |

Example found in examples/root-example.
