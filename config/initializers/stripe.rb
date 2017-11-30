if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_EdBciQMLDMRIXPfGAzOtLQNS',
    secret_key: 'sk_test_DlDgeH49Q6QjSWo3bJITQvLl'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]