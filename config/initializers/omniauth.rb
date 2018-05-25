Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end
