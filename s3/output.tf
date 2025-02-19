
output "website_url" {
  description = "URL del sitio web estático en S3"
  value       = aws_s3_bucket_website_configuration.sergi_website.website_endpoint
}
