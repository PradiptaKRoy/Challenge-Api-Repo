resource "aws_route53_zone" "challenge-ambientia-net" {
  name = "pradiptakumarroy.challenge.ambientia.net"

  tags = {
    Environment = "dev"
  }
}

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.challenge-ambientia-net.zone_id
  name    = "api.pradiptakumarroy.challenge.ambientia.net"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.centos8.public_ip]
}

output "name_server"{
  value=aws_route53_zone.challenge-ambientia-net.name_servers
}
