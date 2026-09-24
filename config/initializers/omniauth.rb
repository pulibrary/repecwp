Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cas, host: 'fed.princeton.edu', url: 'https://fed.princeton.edu/cas'
end
OmniAuth.config.logger = Rails.logger
