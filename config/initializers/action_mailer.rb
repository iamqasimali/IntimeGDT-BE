# config/initializers/action_mailer.rb
ActionMailer::Base.smtp_settings = {
  address:              'smtp-relay.brevo.com',
  port:                 587,
  user_name:            'iamqasimalizahid@gmail.com',
  password:             'V7j9RXZ68YvSFHnI',
  authentication:       'plain',
  enable_starttls_auto: true
}