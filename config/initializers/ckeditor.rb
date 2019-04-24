# Editor Preferences can be updated within the admin panel under "configuration" then "rich editor".
# Or you may set them with an initializer within your application:
SpreeEditor::Config.tap do |config|
  config.ids = 'taxon_translations_attributes_1_description taxon_translations_attributes_2_description taxon_description product_description page_body page_translations_attributes_1_body page_translations_attributes_2_body page_translations_attributes_3_body product_composition_and_care blog_entry_summary blog_entry_body product_featured_tag'
  # change the editor to CKEditor
  config.current_editor = 'CKEditor'
  config.enabled = true
end

# Use this hook to configure ckeditor
Ckeditor.setup do |config|
  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default), :mongo_mapper and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require "ckeditor/orm/active_record"
  require "ckeditor/utils/content_type_detector"

  config.assets_languages = ['en', 'es', 'fr', 'pt', 'ca']
  # Allowed image file types for upload.
  # Set to nil or [] (empty array) for all file types
  # By default: %w(jpg jpeg png gif tiff)
  # config.image_file_types = %w(jpg jpeg png gif tiff)

  # Allowed flash file types for upload.
  # Set to nil or [] (empty array) for all file types
  # By default: %w(jpg jpeg png gif tiff)
  # config.flash_file_types = %w(swf)

  # Allowed attachment file types for upload.
  # Set to nil or [] (empty array) for all file types
  # By default: %w(doc docx xls odt ods pdf rar zip tar tar.gz swf)
  # config.attachment_file_types = %w(doc docx xls odt ods pdf rar zip tar tar.gz swf)

  # Setup authorization to be run as a before filter
  # By default: there is no authorization.
  config.authorize_with :cancan, Spree::Ability

  # Override parent controller CKEditor inherits from
  # By default: 'ApplicationController'
  # config.parent_controller = 'MyController'

  # Asset model classes
  # config.picture_model { Ckeditor::Picture }
  # config.attachment_file_model { Ckeditor::AttachmentFile }

  # Paginate assets
  # By default: 24
  config.default_per_page = 10000

  # Customize ckeditor assets path
  # By default: nil
  # config.asset_path = "http://www.example.com/assets/ckeditor/"

  # To reduce the asset precompilation time, you can limit plugins and/or languages to those you need:
  # By default: nil (no limit)
  # config.assets_languages = ['en', 'uk']
  # config.assets_plugins = ['image', 'smiley']

  # CKEditor CDN
  # More info here http://cdn.ckeditor.com/
  # By default: nil (CDN disabled)
  # config.cdn_url = "//cdn.ckeditor.com/4.5.6/standard/ckeditor.js"

  # JS config url
  # Used when CKEditor CDN enabled
  # By default: "/assets/ckeditor/config.js"
  # config.js_config_url = "/assets/ckeditor/config.js"
end
