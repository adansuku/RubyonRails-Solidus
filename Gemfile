source 'https://rubygems.org'

ruby '2.3.7'

# Bundle edge Rails instead: gem 'rails', :git => 'https://github.com/rails/rails'
gem 'rails', '~> 5.0.7'

gem 'mysql2', '~> 0.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bourbon', '~> 4.3', '>= 4.3.4'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.2.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 9.0', '>= 9.0.6'
  # gem 'ruby-debug-ide', '~> 0.6.1'
  # gem 'debase', '~> 0.2.2'

  gem 'capistrano', '~> 3.6.1'
  gem 'capistrano-bundler', '~> 1.1.4'
  gem 'capistrano-rails', '~> 1.1.8'
  gem 'capistrano-faster-assets', '~> 1.0', '>= 1.0.2'
  # gem 'spree_mail_view', :git => 'https://github.com/picazoH/spree_mail_view.git', :branch => 'master'
  # gem 'guard', '~> 2.14.0'
  # gem 'guard-livereload', '~> 2.5.2'
  # gem 'rack-livereload', '~> 0.3.16'
  gem 'rake'
  gem 'rubocop', '~> 0.48.1', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0', '>= 2.0.1'
  gem 'web-console', '>= 3.5'
end
group :staging do
  gem 'whenever', '~> 0.9.7'
end
group :production do
  gem 'newrelic_rpm', '~> 5.2', '>= 5.2.0.345'
  gem 'puma', '~> 3.12'
  # gem 'therubyracer' no need it we have nodejs, only required for 0.70.x or later
end

# Redis
gem 'redis-rails', '~> 5.0'
# CloudFlare IP
gem 'actionpack-cloudflare'
gem 'rvm1-capistrano3', require: false
gem 'lograge', '~> 0.10.0'

gem 'aws-sdk', '< 2.0'
gem 'compass', '~> 1.0', '>= 1.0.3'
gem 'compass-rails', '~> 3.0', '>= 3.0.1'
# https://github.com/laserlemon/figaro , Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'font-awesome-rails', '4.6.3.1'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sprockets', '~> 3.7'
gem 'sprockets-rails', '~> 3.2'
gem 'sucker_punch', '~> 2.0'
gem 'analytics-ruby'

# Oficial Solidus
gem 'solidus', git: 'https://github.com/solidusio/solidus', branch: 'v2.1.1'
gem 'solidus_auth_devise', git: 'https://github.com/solidusio/solidus_auth_devise', branch: 'master'

# Oficial Solidusio-contrib
gem 'solidus_editor', git: 'https://github.com/solidusio-contrib/solidus_editor', branch: 'master'
gem 'solidus_print_invoice', git: 'https://github.com/solidusio-contrib/solidus_print_invoice', branch: 'master'
gem 'solidus_sitemap', git: 'https://github.com/solidusio-contrib/solidus_sitemap', branch: 'master'
gem 'solidus_static_content', git: 'https://github.com/2beDigital/solidus_static_content'
gem 'solidus_trackers', git: 'https://github.com/solidusio-contrib/solidus_trackers', branch: 'master'

# Globalize
gem 'globalize', git: 'https://github.com/globalize/globalize', branch: 'master'
gem 'solidus_i18n', git: 'https://github.com/solidusio-contrib/solidus_i18n', ref: '946d7256ffae331e6390df36f31ebda1965cdb7f'
gem 'solidus_globalize', git: 'https://github.com/2beDigital/solidus_globalize', branch: 'master'
gem 'devise-i18n', '~> 1.6', '>= 1.6.2'

# 2BeDigital Solidus
gem 'solidus_bootstrap_frontend', git: 'https://github.com/2beDigital/solidus_bootstraps_frontend.git', branch: 'master'
gem 'solidus_paypal_express', git: 'https://github.com/2beDigital/solidus_paypal_express', branch: 'master'
gem 'solidus_redsys', git: 'https://github.com/2beDigital/solidus_redsys', branch: 'master'
gem 'solidus_tobe_improvements', git: 'https://github.com/2beDigital/solidus_tobe_improvements', branch: 'master'
gem 'solidus_import_products', git: 'https://github.com/2beDigital/solidus_import_products',  branch: 'solidus-stable-2-1'
gem 'solidus_minicart', git: 'https://github.com/2beDigital/solidus_minicart', branch: 'master'
gem 'solidus_filter_grid', git: 'https://github.com/2beDigital/solidus_filter_grid', branch: 'master'
gem 'solidus_variant_options', git: 'https://github.com/2beDigital/solidus_variant_options', branch: 'master'
gem 'solidus_variant_all_options', git: 'https://github.com/2beDigital/solidus_variant_all_options', branch: 'master'
gem 'solidus_asset_variant_options', git: 'https://github.com/2bedigital/solidus_asset_variant_options', branch: 'master'
gem 'solidus_related_products', git: 'https://github.com/solidusio-contrib/solidus_related_products', branch: 'master'
gem 'solidus_blogging', git: 'https://github.com/2beDigital/solidus-blogging', branch: 'master'
gem 'solidus_store_locator',  git: 'https://github.com/2beDigital/solidus_store_locator', branch: 'master'
gem 'solidus_wishlist', git: 'https://github.com/2beDigital/solidus_wishlist', branch: 'master'
gem 'solidus_sales', git: 'https://github.com/2beDigital/solidus_sales', branch: 'master'
gem 'solidus_contact_us', git: 'https://github.com/2beDigital/solidus_contact_us', branch: 'master'
gem 'solidus_return_authorizations_frontend', git: 'https://github.com/2beDigital/solidus_return_authorizations_frontend', branch: 'master'
gem 'solidus_segment', git: 'https://github.com/2beDigital/solidus_segment', branch: 'master'
# gem 'solidus_rgpd', git: 'https://github.com/2bedigital/solidus_rgpd', branch: 'master'
gem 'solidus_theme_moncho', git: 'https://support2bedigital:BORRASPICAZO01@bitbucket.org/2bedigital/solidus_theme_moncho', branch: 'master'

