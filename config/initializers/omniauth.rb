Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['Google_Client_Key'], ENV['Google_Client_Secret']
end