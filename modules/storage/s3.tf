resource "aws_s3_bucket" "terr-nextcloud-bucket" {
    bucket = "terr-nextcloud-bucket"

    tags = {
        Name  = "terr-nextcloud-bucket"
    }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.terr-nextcloud-bucket.id
  acl    = "private"
}

resource "aws_s3_object" "scripts" {
  for_each = fileset("/home/userboi/Documents/Terraform_aws/config_files/", "*")

  bucket = aws_s3_bucket.terr-nextcloud-bucket.id
  key    = each.value
  source = "/home/userboi/Documents/Terraform_aws/config_files/${each.value}"
  # etag makes the file update when it changes; see https://stackoverflow.com/questions/56107258/terraform-upload-file-to-s3-on-every-apply
  etag   = filemd5("/home/userboi/Documents/Terraform_aws/config_files/${each.value}")
}
