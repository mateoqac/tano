# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smpt.sendgrid.net',
  port: 587,
  user_name: 'apikey',
  password: ENV.fetch('SENDGRID_API_KEY'),
  domain: 'ciudadaniaitalia.com',
  authentication: :plain,
  enable_starttls_auto: true
}