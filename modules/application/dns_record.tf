resource "aws_route53_record" "nextcloud_record" {
  count           = var.vpn_mode == "false" ? 1 : 0
  allow_overwrite = true
  name            = var.record_name
  records         = [ aws_lb.load-balancer[count.index].dns_name ]
  type            = "CNAME"
  zone_id         = var.hosted_zone_id
  ttl             = 9600

}
