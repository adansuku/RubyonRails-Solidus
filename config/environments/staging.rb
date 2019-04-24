Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

	config.enable_dependency_loading=true

	config.force_ssl = true
  config.ssl_options = { redirect: { exclude: -> request { request.path =~ /healthcheck|redsys_notify/ } } }

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = Uglifier.new(harmony: true)
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # `config.assets.precompile` has moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

	config.cache_store = :redis_store,{
	 		host: ENV['redis_host'],
	 		port: ENV['redis_port'],
	 		namespace: ENV['redis_namespace'],
	 		expires_in: ENV['redis_expires_in']
	}

  #config.cache_store = :redis_store, ENV['CACHE_URL'],
  #  { namespace: 'spree::cache' }

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

	# Action Mailer configuration
  config.action_mailer.default_url_options = {:host => ENV['config_action_mailer_default_url_options_host']}
  config.action_mailer.perform_deliveries = true
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address:              ENV['action_mailer_smtp_settings_address'],
		port:                 ENV['action_mailer_smtp_settings_port'],
		domain:               ENV['action_mailer_smtp_settings_domain'],
		user_name:            ENV['action_mailer_smtp_settings_user_name'],
		password:             ENV['action_mailer_smtp_settings_password'],
		authentication:       ENV['action_mailer_smtp_settings_authentication'],
		enable_starttls_auto: ENV['action_mailer_smtp_settings_enable_starttls_auto']
	}
	ActionMailer::Base.default :from => ENV['ActionMailer_Base_default_from']
  ActionMailer::Base.default :bcc  => ENV["ActionMailer_default_options_bcc"]
  config.action_mailer.default_url_options = {:host => ENV["ActionMailer_default_url_options"]}

	# ActiveJob queue
	config.active_job.queue_adapter = :sucker_punch

end
