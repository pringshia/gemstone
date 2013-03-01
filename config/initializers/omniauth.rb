OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Gemstone::Application.config.FACEBOOK_API_KEY , Gemstone::Application.config.FACEBOOK_APP_SECRET, {scope: "user_photos"}
end
