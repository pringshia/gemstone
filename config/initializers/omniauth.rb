OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "210880035720880", "bdb8663b6bed585f52b4d9da84583e34"
end
