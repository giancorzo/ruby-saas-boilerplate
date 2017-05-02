Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_region] = Figaro.env.aws_region
Paperclip::Attachment.default_options[:s3_protocol] = "https"
Paperclip::Attachment.default_options[:s3_credentials] = {
  bucket: Figaro.env.s3_bucket_name,
  access_key_id: Figaro.env.aws_access_key_id,
  secret_access_key: Figaro.env.aws_secret_access_key
}

Paperclip::Attachment.default_options[:url] = ":s3_domain_url"
Paperclip::Attachment.default_options[:path] = "/:class/:attachment/:id_partition/:style/:filename"
