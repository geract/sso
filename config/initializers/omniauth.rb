Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_OAUTH_CLIENT_ID'), ENV.fetch('GOOGLE_OAUTH_CLIENT_SECRET')
end
OmniAuth.config.allowed_request_methods = %i[get]
