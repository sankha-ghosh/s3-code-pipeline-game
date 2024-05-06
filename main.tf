provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "game_bucket" {
  bucket = "my-meme-card-game"
  

  tags = {
    Name        = "My_bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = "my-meme-card-game"
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "my-meme-card-game"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = ["arn:aws:s3:::my-mem-card-game/*"]
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = "my-meme-card-game"

  index_document {
    suffix = "index.html"
  }
}


# resource "aws_s3_bucket" "website" {
#   bucket = "your-website-bucket"
#   acl    = "public-read"
#   policy = <<POLICY{
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "PublicReadGetObject",
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "s3:GetObject",
#       "Resource": "arn:aws:s3:::your-website-bucket/*"
#     }
#   ]
# }
# POLICY
# }



















# provider "aws" {
#   region = "eu-west-2"
# }

# resource "aws_s3_bucket" "game_bucket" {
#   bucket = "my-meme-card-game"

#   tags = {
#     Name        = "My_bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.game_bucket.id
#   acl    = "public-read"
# }

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.game_bucket.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid       = "PublicReadGetObject"
#         Effect    = "Allow"
#         Principal = "*"
#         Action    = ["s3:GetObject"]
#         Resource  = ["arn:aws:s3:::game_bucket/*"]
#       }
#     ]
#   })
# }

# resource "aws_s3_object" "object" {
#   bucket = "game_bucket"
#   key    = "game_file"
#   source = "../game_file"
#   depends_on = [ aws_s3_bucket.game_bucket ]
# }

# resource "aws_s3_bucket_website_configuration" "example" {
#   bucket = aws_s3_bucket.game_bucket.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }
# } 
