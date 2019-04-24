# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|
  # Without this preferences are loaded and persisted to the database. This
  # changes them to be stored in memory.
  # This will be the default in a future version.

  config.use_static_preferences!

  # Core:

  # Default currency for new sites
  config.currency = "EUR"

  # from address for transactional emails
  #config.mails_from = "store@example.com"

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3


  # Frontend:

  # Custom logo for the frontend
  config.logo = 'sprite.png'

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  config.admin_interface_logo = 'sprite.png'

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test_mode: !Rails.env.production?
  # )

  config.default_country_id = 68
  config.address_requires_state = true
  config.allow_guest_checkout = false
  config.products_per_page = 10
  config.company = true
  config.max_level_in_taxons_menu = 2

  #inventory, stocks, shipping
  config.track_inventory_levels = true
  #config.allow_backorder_shipping = true
  config.shipping_instructions = true
  config.mails_from = ENV["ActionMailer_default_options_from"]

end

Kaminari.config.default_per_page = 100

Spree::Frontend::Config[:locale] = 'es'
Spree::Backend::Config[:locale] = 'es'

Spree::Api::Config.configure do |config|
  config.use_static_preferences!

  config.requires_authentication = true
end

SolidusI18n::Config.available_locales = [:es, :en] # displayed on frontend select box
SolidusGlobalize::Config.supported_locales = [:es, :en] # displayed on translation forms
Spree::PermittedAttributes.user_attributes << :locale
Spree::PrintInvoice::Config.set(print_invoice_logo_path: 'sprite.png')
Spree::PrintInvoice::Config.set(print_invoice_next_number: Spree::PrintInvoice::Config.print_invoice_next_number ||= 1)
SolidusVariantOptions::VariantConfig.option_value_default_style = :mini
Spree::PermittedAttributes.store_attributes << :minimum_order_value
Spree::PermittedAttributes.address_attributes << [:dni, :birth_day, :request_invoice]
Spree::PermittedAttributes.checkout_attributes << [:sent_as_a_gift, :picked_store, :send_gift_text]
Spree::PermittedAttributes.taxon_attributes << :available_on
Spree::PermittedAttributes.product_attributes << [:featured_tag]
Rack::Utils.multipart_part_limit = 0
Spree::Api::ApiHelpers.order_attributes.push(:sent_as_a_gift, :picked_store, :send_gift_text)
Spree::Api::ApiHelpers.product_attributes.push(:featured_tag)
Spree::Api::ApiHelpers.address_attributes.push(:dni, :birth_day, :request_invoice)
SolidusContactUs.mailer_to = ENV["ActionMailer_default_options_bcc"]
SolidusContactUs.mailer_bcc = ENV["ActionMailer_default_options_bcc"]
Spree::Ability.register_ability(BarAbility) 
Rails.application.config.spree.promotions.actions << Spree::Promotion::Actions::CreateLineItems
# This logic needed confirm email after registration
Spree::Auth::Config[:confirmable] = false
# This logic needed b/c devise wants to log us out after password changes
#Spree::Auth::Config[:signout_after_password_change]