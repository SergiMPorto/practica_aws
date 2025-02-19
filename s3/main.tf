resource "aws_s3_bucket" "sergi_website" {
  bucket = "kc-sergi-website"

  tags = {
    Name = "kc-sergi-website"
  }
}

//Recurso específico para web estática. 
resource "aws_s3_bucket_website_configuration" "sergi_website" {
  bucket = aws_s3_bucket.sergi_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
//Para que el aws coja el index.html
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.sergi_website.id
  key          = "index.html"
  source = "${path.module}/index.html"
 content_type = "text/html"
}



  

resource "aws_s3_bucket_public_access_block" "sergi_website" {
  bucket = aws_s3_bucket.sergi_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}








// Política de acceso público para
resource "aws_s3_bucket_policy" "sergi_website" {
  bucket = aws_s3_bucket.sergi_website.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          "${aws_s3_bucket.sergi_website.arn}/*",
        ]
      },
    ]
  })
}






