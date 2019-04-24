require 'product_duplicator'
require 'product_filters'
module ApplicationHelper
	include Sales
	include Spree::ImprovementsHelper
  	include Spree::PagesHelper
	include Spree::TrackersHelper
end
