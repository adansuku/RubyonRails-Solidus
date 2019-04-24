Spree::UserMailer.class_eval do
  helper 'spree/improvements'
  def reset_password_instructions(user, token, *args)
    @user = user
    @store = Spree::Store.default
    I18n.locale = locale
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links 
    @edit_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: @store.url)
    mail to: user.email, from: from_address(@store), subject: "#{@store.name} #{I18n.t(:subject, scope: [:devise, :mailer, :reset_password_instructions])}"
  end
  def user_welcome_email(user, *args)
    @user = user
    @store = Spree::Store.default
    I18n.locale = locale
    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links 
    mail to: @user.email, from: from_address(@store), subject: "#{@store.name} #{I18n.t(:subject, scope: [:spree, :user_mailer, :welcome])}"
  end
end