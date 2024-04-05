Rails.configuration.stripe = {
  publishable_key: ENV["pk_test_51ORKLdLsgQoSn0rxu1uLMMRO6aLyg85UFazilXL6qRPSe0ovomslJYCNePzr7qwsY7sgjSFuU9INBBWycBZRn4TK00HPQUAgD0"],
  secret_key: ENV["sk_test_51ORKLdLsgQoSn0rxuXB5YP5rY1dk7ReeqsKYClYjYDznbsEDYHyCXyGTPbG2jTZnka03jvbr6glSaUfp6AW2Jqdn00BD2QMbxk"]
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]