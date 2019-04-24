Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # https://stackoverflow.com/questions/29417328/how-to-disable-cannot-render-console-from-on-rails
  config.web_console.whiny_requests = false

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.assets.digest = false

  #config.assets.compile = false

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Default_host to action mailer in enviroment development
  config.action_mailer.default_url_options = { host: "localhost:3000" }

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              ENV["ActionMailer_address"],
    port:                 ENV["ActionMailer_port"],
    domain:               ENV["ActionMailer_domain"],
    user_name:            ENV["ActionMailer_user_name"],
    password:             ENV["ActionMailer_password"],
    authentication:       ENV["ActionMailer_authentication"],
    enable_starttls_auto: ENV["ActionMailer_enable_starttls_auto"]
  }
  ActionMailer::Base.default :from => ENV["ActionMailer_default_options_from"]
  ActionMailer::Base.default :bcc  => ENV["ActionMailer_default_options_bcc"]
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Since we're using Redis for Sidekiq, we might as well use Redis to back
  # our cache store. This keeps our application stateless as well.
  # config.cache_store = :redis_store, ENV['CACHE_URL'],
  #     { namespace: 'spree::cache' }
  # ActiveJob queue
  config.active_job.queue_adapter = :sucker_punch

end
