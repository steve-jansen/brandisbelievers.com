data "aws_route53_zone" "main" {
  name = var.website["domain"]
}

resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.website["host"]
  type    = "A"

  alias {
    zone_id                = aws_s3_bucket.main.hosted_zone_id
    name                   = aws_s3_bucket.main.website_domain
    evaluate_target_health = false
  }
}
