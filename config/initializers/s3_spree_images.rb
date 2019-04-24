# config/initializers/s3_spree_images.rb
# https://github.com/solidusio/solidus/wiki/Storing-images-on-S3-and-CDN's
attachment_config = {

  s3_credentials: {
    access_key_id:     ENV['S3_access_key_id'],
    secret_access_key: ENV['S3_secret_access_key'],
    bucket:            ENV['S3_bucket_name']
  },

  storage:        :s3,
  s3_headers:     { "Cache-Control" => "max-age=31557600" },
  s3_protocol:    "https",
  url:            ':s3_alias_url',
  s3_host_alias:  ENV['Cloudfront_distribution'],


  styles: {
      ## Portrait
      mini:     "75x50>",
      small:    "225x150>",
      product:  "500x750>",
      large:    "635x950>"
      ## Landscape
      #mini:     "48x48>",
      #small:    "300x300>",
      #product:  "470x320#",
      #large:    "735x971>"
  },

  path:           "images/:id/:style/:basename.:extension",
  default_url:    'noimage/:style.png',
  default_style:  "product"
}

attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end unless Rails.env.test?
