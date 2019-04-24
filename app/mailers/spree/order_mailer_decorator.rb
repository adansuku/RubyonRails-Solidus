Spree::OrderMailer.class_eval do
  helper 'spree/improvements'
  helper 'spree/base'
  helper 'application'
  def confirm_email(order, resend = false)
    @order = order
    I18n.locale = @order.user.locale
    @store = @order.store
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links    
    subject = build_subject(Spree.t('order_mailer.confirm_email.subject'), resend)
    mail(to: @order.email, from: from_address(@store), subject: subject)
  end
  def cancel_email(order, resend = false)
    @order = order
    I18n.locale = @order.user.locale
    @store = @order.store
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links     
    subject = build_subject(Spree.t('order_mailer.confirm_email.subject'), resend)
    mail(to: @order.email, from: from_address(@store), subject: subject)
  end
  def inventory_cancellation_email(order, inventory_units, resend = false)
    @order, @inventory_units = order, inventory_units
    I18n.locale = @order.user.locale
    @store = @order.store
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links 
    subject = build_subject(Spree.t('order_mailer.inventory_cancellation.subject'), resend)
    mail(to: @order.email, from: from_address(@store), subject: subject)
  end
  def confirm_payment(order_id, resend = false)
    @order = Spree::Order.find_by(number: order_id)
    I18n.locale = :es
    @store = Spree::Store.default
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links    
    subject = build_subject(Spree.t('order_mailer.confirm_payment.subject'), resend)
    mail(to: @order.email, from: from_address(@store), subject: subject)
  end
end
