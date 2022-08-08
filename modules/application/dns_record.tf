resource "aws_route53_record" "nextcloud_record" {
  allow_overwrite = true
  name            = var.record_name
  records         = [ aws_lb.load-balancer.dns_name ]
  type            = "CNAME"
  zone_id         = var.hosted_zone_id
  ttl             = 9600

}
