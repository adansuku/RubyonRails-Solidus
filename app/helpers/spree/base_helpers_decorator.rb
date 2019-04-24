Spree::BaseHelper.module_eval do
	def flash_messages(opts = {})
	    ignore_types = ["order_completed"].concat(Array(opts[:ignore_types]).map(&:to_s) || [])

	    flash.each do |msg_type, text|
	      unless ignore_types.include?(msg_type)
	        advice = (msg_type == 'error') ? content_tag(:i, '', class: "fa fa-exclamation-triangle fa-lg") : content_tag(:i, '', class: "fa fa-info-circle fa-lg")
	        concat(content_tag :div, raw(advice) + text, class: "alert alert-#{msg_type}")
	      end
	    end
	    nil
	end
	def flag_image_url(locale)
		asset_url "flags/" + locale.to_s + '.png'
	end
	def hreflang
     path = (request.present? && request.path.size > 1 && @page.nil?) ? request.path : ''
    SolidusI18n::Config.available_locales.map do |locale|
			tag(:link, href: 'https://' + current_store.url + '/' + locale.to_s + path , hreflang: locale.to_s, rel: :alternate)
		end.join("\n").html_safe
	end
	def redirection_page_order_scope()
		return products_path if current_page?(products_path)
		nested_taxons_url
	end

	 def is_some_path?(some_path)
		(request.fullpath === some_path) ? 'active' : 'not'
	end


	def is_active_path?(page_uri)
		(request.fullpath.gsub('//','/') === page_uri) ? 'active' : nil
	end

	def get_taxonomies
		@taxonomies ||= Spree::Taxonomy.includes(root: :children)
	end

	def is_retailer?
		(spree_current_user and spree_current_user.has_spree_role? :retail) ? true : false
	end

	def is_admin?
		(spree_current_user and spree_current_user.has_spree_role? :admin) ? true : false
	end

	def seo_url(taxon)
	  return spree.nested_taxons_path(taxon.permalink) unless taxon.nil?
	end

	def body_class
		if  (request.path == '/' || request.path == '/en' )
			@body_class = "home"
		elsif request.path.include?( '/editorial/')
			@body_class = "editorial"
		end
  end

  def count_taxon_images(root_taxon)
    count = 0
    if root_taxon.icon.present?
      count += 1
    end
    root_taxon.children.map do |taxon|
      if taxon.icon.present?
        count += 1
      end
    end
    return count
  end

  def taxons_tree_images(root_taxon)
    root_taxon.children.map do |taxon|
      if taxon.icon.present?
        content_tag :li, class: 'col-md-6 li-images' do
          link_to(image_tag(taxon.icon.url(:normal), class: 'icon-images'), seo_url(taxon))
        end
      end
    end.join("\n").html_safe
  end

	def taxonomy_images(root_taxon)
		taxon = Spree::Taxon.find_by_id(root_taxon.id)
		if taxon.root?
			link_to(image_tag(taxon.icon.url(:normal), class: 'icon-images'), seo_url(taxon))
		end
	end

  def taxons_tree(root_taxon, current_taxon, max_level = 2, col)
    return '' if max_level < 1 || root_taxon.children.empty?
    root_taxon.children.map do |taxon|
      css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? "col-xs-12 col-sm-12 col-md-#{col} li-links active" : "col-xs-12 col-sm-12 col-md-#{col} li-links"
      if taxon.available?
        content_tag :li, class: css_class do
          link_to(taxon.name, seo_url(taxon)) +
              taxons_tree_2(taxon, current_taxon, max_level - 1)
        end
      end
    end.join("\n").html_safe
  end

  def taxons_tree_2(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, class: 'secondary-ul' do
      root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : nil
        if taxon.available?
          content_tag :li, class: css_class do
            link_to(taxon.name, seo_url(taxon)) +
                taxons_tree_2(taxon, current_taxon, max_level - 1)
          end
        end
      end.join("\n").html_safe
    end
  end

  def taxons_sidebar(root_taxon, current_taxon, max_level = 2)
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, class: 'dropdown-menu secondary-list-sidebar' do
      root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : nil
        if taxon.available?
          content_tag :li, class: css_class do
            link_to(taxon.name, seo_url(taxon)) +
                taxons_tree_2(taxon, current_taxon, max_level - 1)
          end
        end
      end.join("\n").html_safe
    end
  end

  def breadcrumbs(taxon, separator="&nbsp;")
    return "" if current_page?("/") || taxon.nil? || (taxon.products.blank? && taxon.description.present?)
    separator = raw(separator)
    crumbs = [content_tag(:li, link_to(Spree.t(:home), spree.root_path) + separator)]
    if taxon
      #crumbs << content_tag(:li, link_to(Spree.t(:products), products_path) + separator)
      crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
      crumbs << content_tag(:li, link_to(taxon.name, seo_url(taxon), class: 'active'))
    else
      crumbs << content_tag(:li, Spree.t(:products), class: 'active')
    end
    crumb_list = content_tag(:ol, raw(crumbs.flatten.map{|li| li.mb_chars}.join), class: 'breadcrumb')
    #crumb_list = content_tag(:nav, crumb_list, id: 'breadcrumbs', class: 'breadcrumb')
    content_tag(:div, crumb_list, class: 'col-xs-12 col-sm-6 col-md-6 col-lg-6')
  end

  def page_present?(slug)
    page = Spree::Page.find_by(slug:slug)
    return page.present? && page.visible
  end

  def is_forbidden_country?
    Spree::Config.selling_zone.include? session[:referrer_country].to_s.upcase
  end

  def find_page(slug)
    pages = []
    Spree::Page.with_translations.visible.map {|x| pages << x if x.slug.present? && x.slug.include?(slug)}
    return pages
  end

  def can_show_filters?
    return (current_page?(products_path) && !params[:keywords]) || (!@taxon.nil? && (current_page?("/t/#{@taxon.permalink}") || current_page?("/#{locale.to_s}/t/#{@taxon.permalink}")) && (@taxon.description.blank? || @taxon.description.present? && @taxon.products.present? && @taxon.description.length < 1000 ))
  end

  def group_by_country
    options = []
    Spree::StoreLocator.with_translations.where('spree_store_locator_translations.country NOT IN (?)', ['España','Spain','']).map { |x| options << [x.country, Spree::StoreLocator.where(country: x.country).map {|v| [ v.name, v.address1] }]}
    return options.uniq
  end

  def find_available_taxon(product)
    cache_key = "find_available_taxon-#{product.id}-#{product.updated_at}"
    Rails.cache.fetch("#{cache_key}/taxon_id", expires_in: 6.hours) do
      taxons = Spree::Taxon.where(id: product.taxon_ids).where.not(available_on: nil)
      return taxons.first.id if taxons.first.present?
    end
  end

  def item_display_price(item)
    cache_key = "display-item-price-#{item.id}-#{item.updated_at}"
    Rails.cache.fetch("#{cache_key}/product_id", expires_in: 6.hours) do
      price = (is_promotionable?(item.product) && percentage(item,item.product.id) > 0) ? item.product.price * ( 100 - percentage(item,item.product.id) ) / 100 : item.product.price 
      return price * item.quantity
    end
  end

  def display_subtotal(order)
      total_items = 0
      order.line_items.map { |i| total_items += item_display_price(i)}
      to_money(total_items)
  end

end