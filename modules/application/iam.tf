resource "aws_iam_role" "vpn-s3-role" {
    name = "vpn-s3-role"
    
    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
    })
}

resource "aws_iam_policy" "s3-read-policy" {
  name        = "S3-ReadOnly"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ListObjectsInBucket",
            "Effect": "Allow",
            "Action": ["s3:ListBucket"],
            "Resource": ["arn:aws:s3:::terr-nextcloud-bucket"]
        },
        {
            "Sid": "AllObjectActions",
            "Effect": "Allow",
            "Action": "s3:*Object",
            "Resource": ["arn:aws:s3:::terr-nextcloud-bucket/*"]
        }
    ]
  })
}

resource "aws_iam_instance_profile" "vpn-s3-role" {
    name = "vpn-s3-role"
    role = aws_iam_role.vpn-s3-role.name
}

resource "aws_iam_role_policy_attachment" "role-policy-attachment" {

  role       = aws_iam_role.vpn-s3-role.name
  policy_arn = aws_iam_policy.s3-read-policy.arn
}
