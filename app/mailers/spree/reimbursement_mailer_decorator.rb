Spree::ReimbursementMailer.class_eval do
	helper 'spree/improvements'
    def reimbursement_email(reimbursement, resend = false)
      @reimbursement = reimbursement.respond_to?(:id) ? reimbursement : Spree::Reimbursement.find(reimbursement)
      I18n.locale = @reimbursement.order.user.locale
      @store = @reimbursement.order.store
      @taxonomies = Spree::Taxonomy.includes(root: :children).with_translations
      @pages = Spree::Page.by_store(@store).with_translations.visible.header_links 
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{Spree.t('reimbursement_mailer.reimbursement_email.subject')} ##{@reimbursement.order.number}"
      mail(to: @reimbursement.order.email, from: from_address(@store), subject: subject)
    end
end