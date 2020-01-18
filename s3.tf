locals {
  domain = format("%s%s%s", var.website["host"], length(var.website["host"]) > 0 ? "." : "", var.website["domain"])
}

resource "aws_s3_bucket" "main" {
  bucket = local.domain
  acl    = "public-read"
  policy = templatefile("policy.json.tmpl", { domain = local.domain })

  website {
    redirect_all_requests_to = "https://pages.lls.org/mwoy/nc/clt20/bjansen"
  }
}

variable "website" {
  type        = map(string)
  description = "Configuration parameters for the S3 hosted website"
}
