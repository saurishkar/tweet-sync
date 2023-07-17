Rails.application.config.middlware.use OmniAuth::Builder do
  provider :twitter, Rails.application.credentials.dig(:twitter, :api_key), Rails.application.credentials.dig(:twitter, :api_secret)
end
