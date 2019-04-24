# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w( ckeditor/*)
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

### spree_editor ###
=begin
Rails.application.config.assets.precompile += %w( ckeditor/config.js )
Rails.application.config.assets.precompile += %w( ckeditor/styles.js)
Rails.application.config.assets.precompile += %w( ckeditor/contents.css )
Rails.application.config.assets.precompile += %w( tinymce-jquery.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/javascripts/fileuploader.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/javascripts/jquery.endless-scroll.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/javascripts/jquery.min.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/javascripts/jquery.tmpl.min.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/javascripts/rails.js )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/stylesheets/uploader.css )
Rails.application.config.assets.precompile += %w( ckeditor/CHANGES.md )
Rails.application.config.assets.precompile += %w( ckeditor/LICENSE.md )
Rails.application.config.assets.precompile += %w( ckeditor/README.md )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/a11yhelp/dialogs/lang/_translationstatus.txt )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/preview/preview.html )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/scayt/LICENSE.md )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/scayt/README.md )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/specialchar/dialogs/lang/_translationstatus.txt )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/wsc/LICENSE.md )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/wsc/README.md )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/wsc/dialogs/ciframe.html )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/wsc/dialogs/tmp.html )
Rails.application.config.assets.precompile += %w( ckeditor/plugins/wsc/dialogs/tmpFrameset.html )
Rails.application.config.assets.precompile += %w( ckeditor/skins/moono/readme.md )
=end

Rails.application.config.assets.precompile += %w( flags/* )
