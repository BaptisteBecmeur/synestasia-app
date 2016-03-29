Rails.application.config.middleware.use OmniAuth::Builder do
  # Placed your provider(s)
  # Example
  # provider :oauth, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
  # provider :facebook, Rails.application.secrets.facebook_omniauth_provider_key, Rails.application.secrets.facebook_omniauth_provider_secret
end
