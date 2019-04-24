Spree::ContactUs::ContactMailer.class_eval do
   	def contact_email(contact)
		@contact = contact
		@store = Spree::Store.default
	    @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
	    @pages = Spree::Page.by_store(@store).with_translations.visible.header_links  
		mail :from     => (Spree::Config.mails_from || @contact.email),
		     :reply_to => @contact.email,
		     :subject  => (SolidusContactUs.require_subject ? @contact.subject : Spree.t(:subject, :email => @contact.email)),
		     :to       => SolidusContactUs.mailer_to,
		     :bcc      => SolidusContactUs.mailer_bcc
	end
end