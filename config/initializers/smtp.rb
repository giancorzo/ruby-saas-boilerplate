if Rails.env.production?
  SMTP_SETTINGS = {
    address: "email-smtp.us-west-2.amazonaws.com",
    authentication: :login,
    domain: Figaro.env.smtp_domain,
    password: Figaro.env.aws_secret_access_key,
    enable_starttls_auto: true,
    port: 587,
    user_name: Figaro.env.aws_access_key_id
  }
end
