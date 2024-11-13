Rails.application.config.after_initialize do
  HealthMonitor.configure do |config|
    # Make this health check available at /health
    config.path = :health

    config.file_absence.configure do |file_config|
      file_config.filename = "public/remove-from-nginx"
    end
  end
end
