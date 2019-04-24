Spree::TestMailer.class_eval do
	helper 'spree/improvements'
	def test_email(email)
      @store = Spree::Store.default
      @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
      @pages = Spree::Page.by_store(@store).with_translations.visible.header_links 
      subject = "#{@store.name} #{Spree.t('test_mailer.test_email.subject')}"
      mail(to: email, from: from_address(@store), subject: subject)
    end
end