resource "aws_s3_bucket" "pradiptakumarroy" {
  bucket = "website-repository"
  acl    = "public-read"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }    
}

