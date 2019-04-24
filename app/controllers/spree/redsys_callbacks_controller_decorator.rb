Spree::RedsysCallbacksController.class_eval do
		after_action :send_confirm_mail, only: [:redsys_confirm]

		def send_confirm_mail
			Spree::OrderMailer.confirm_payment(params[:order_id]).deliver_later
			order = Spree::Order.find_by(number: params[:order_id])
			if order.adjustments.first.source_type == 'App::Invoice'
				order.update_attributes(state: 'confirm', completed_at: nil)
			end
		end
end