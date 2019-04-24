# config/initializers/paperclip.rb
# https://github.com/solidusio/solidus/wiki/Storing-images-on-S3-and-CDN's
if ENV['S3_access_key_id']
  Paperclip::Attachment.default_options.merge!(
      :storage => :s3,
      :s3_protocol => "https",
      :s3_host_name =>  ENV["S3_host_name"],
      :s3_credentials => {
          :bucket => ENV["S3_bucket_name"],
          :access_key_id => ENV["S3_access_key_id"],
          :secret_access_key => ENV["S3_secret_access_key"]
      }
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
  # Nota Héctor 20/04/2017 in case of:  [paperclip] Content Type Spoof: Filename ...
  # first try docker-compose up --build
  # https://github.com/thoughtbot/paperclip/issues/2195
  #Paperclip::Attachment.default_options[:validate_media_type] = false
end

