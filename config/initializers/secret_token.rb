# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || '92b001c21282937690f98d9ad7520faa7686faeb873bc60e55b9adde34d8eb60c3c04679ff3c79368e25e4d253c5560978efb7bb51e748bbe0253c49383c5a68'
