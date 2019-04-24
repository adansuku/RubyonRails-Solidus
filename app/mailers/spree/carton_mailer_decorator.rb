Spree::CartonMailer.class_eval do
  helper 'spree/improvements'
  def shipped_email(options, deprecated_options = {})
    @order = options.fetch(:order)
    @store = @order.store
    I18n.locale = @order.user.locale
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links     
    @carton = options.fetch(:carton)
    @manifest = @carton.manifest_for_order(@order)
    options = { resend: false }.merge(options)
    subject = (options[:resend] ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{@store.name} #{Spree.t('shipment_mailer.shipped_email.subject')} ##{@order.number}"
    mail(to: @order.email, from: from_address(@store), subject: subject)
  end
end