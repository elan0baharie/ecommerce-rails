Rails.configuration.stripe = {
  :publishable_key => 'pk_test_lQPBydmUy4Aw806YMzHfLl8G',
  :secret_key      => 'sk_test_WjeiQhClcupJePf6YEbyDNfH'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
