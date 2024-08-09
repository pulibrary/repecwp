Rails.application.config.after_initialize do
  HealthMonitor.configure do |config|
    # Make this health check available at /health
    config.path = :health
  end
end
