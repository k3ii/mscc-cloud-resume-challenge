resource "aws_acm_certificate" "cert" {
  domain_name               = var.subdomain_name
  key_algorithm             = "RSA_2048"
  subject_alternative_names = [var.subdomain_name]
  validation_method         = "DNS"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}
