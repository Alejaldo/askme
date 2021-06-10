Recaptcha.configure do |config|
  config.site_key = ENV['RECAPTCHA_BOJO_SITE_KEY']
  config.secret_key = ENV['RECAPTCHA_BOJO_SECRET_KEY']
end
