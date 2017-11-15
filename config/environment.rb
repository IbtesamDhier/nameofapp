# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: 'app80085053@heroku.com',
  password: ENV['sam2152011*'],
  enable_starttls_auto: true
}

