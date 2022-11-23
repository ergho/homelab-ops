variable "cloudflare_acc_id" {
    type = string
    description = "Cloudflare Account ID"
}

variable "cloudflare_email" {
    type = string
    description = "Cloudflare Email"
}

variable "cloudflare_api_key" {
    type = string
    description = "Cloudflare Api Key"
}

variable "cloudflare_domain_org" {
    type = string
    description = "My org domain"
}

#sendgrid variables

variable "sendgrid_1" {
    type = string
    description = "First sendgrid cname"
}
variable "sendgrid_2" {
    type = string
    description =  "Second sendgrid cname"
}
variable "sendgrid_3" {
    type = string
    description =  "Third sendgrid cname"
}
variable "sendgrid_s1" {
    type = string
    description = "domain key"
}
variable "sendgrid_s2" {
    type = string
    description =  "domain key"
}

# other existing dns records?
