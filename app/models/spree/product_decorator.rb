Spree::Product.class_eval do
  translates :name, :description, :meta_description, :meta_keywords, :slug, :composition_and_care, :featured_tag,
             fallbacks_for_empty_translations: true
end