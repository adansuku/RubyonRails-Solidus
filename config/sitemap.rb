SitemapGenerator::Sitemap.default_host = "https://#{Spree::Store.default.url}"

##
## If using Heroku or similar service where you want sitemaps to live in S3 you'll need to setup these settings.
##

## Pick a place safe to write the files
# SitemapGenerator::Sitemap.public_path = 'tmp/'

## Store on S3 using Fog - Note must add fog to your Gemfile.
# SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(aws_access_key_id:     Spree::Config[:s3_access_key],
#                                                                     aws_secret_access_key: Spree::Config[:s3_secret],
#                                                                     fog_provider:          'AWS',
#                                                                     fog_directory:         Spree::Config[:s3_bucket])

## Inform the map cross-linking where to find the other maps.
# SitemapGenerator::Sitemap.sitemaps_host = "http://#{Spree::Config[:s3_bucket]}.s3.amazonaws.com/"

## Pick a namespace within your bucket to organize your maps. Note you'll need to set this directory to be public.
# SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
=begin
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options = {})
  #        (default options are used if you don't specify)
  #
  # Defaults: priority: 0.5, changefreq: 'weekly',
  #           lastmod: Time.now, host: default_host
  #
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, priority: 0.7, changefreq: 'daily'
  #
  # Add individual articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), lastmod: article.updated_at
  #   end
  add_login
  add_signup
  add_account
  add_password_reset
  add_taxons
  add_products
end
=end

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add individual articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  def add_products_multilingual(locale_param, options = {})
    I18n.locale = locale_param
    all_products = Spree::Product.all
    add(products_path, options.merge(lastmod: all_products.last_updated))
    all_products.each do |product|
      add(product_path(product), options.merge(lastmod: product.updated_at)) if product.available?
    end
  end

  def add_pages(options = {})
    visible_pages = Spree::Page.visible
    visible_pages.each do |page|
      add(page.slug, options.merge(lastmod: page.updated_at))
    end
  end

  def add_login_multilingual(locale_param, options = {})
    I18n.locale = locale_param
    add(login_path, options)
  end

  def add_signup_multilingual(locale_param, options = {})
    I18n.locale = locale_param
    add(signup_path, options)
  end

  def add_account_multilingual(locale_param, options = {})
    I18n.locale = locale_param
    add(account_path, options)
  end

  def add_taxons_multilingual(locale_param, options = {})
    I18n.locale = locale_param
    Spree::Taxon.roots.each { |taxon| add_taxon(taxon, options) }
  end


  add_taxons

  SolidusGlobalize::Config.supported_locales.each do |locale|
    add_products_multilingual(locale)
  end

  add_pages
end
