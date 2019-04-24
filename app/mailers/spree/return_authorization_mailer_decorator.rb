Spree::ReturnAuthorizationMailer.class_eval do
  def return_authorization_email(return_authorization, resend = false)
    @ra = return_authorization.respond_to?(:id) ? return_authorization : Spree::ReturnAuthorization.find(return_authorization)
    @store = @ra.order.store
    I18n.locale = @ra.order.user.locale
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links    
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{@store.name} #{Spree.t('return_authorization_mailer.return_authorization_email.subject')} ##{@ra.number}"
    mail(to: @ra.order.email, from: from_address(@store), bcc: from_address(@store), subject: subject)
  end
end