Sales.module_eval do

	def get_percent(promotion)
		if promotion.actions.present? && promotion.actions.first.type != "Spree::Promotion::Actions::CreateLineItems"
			return promotion.actions.first.calculator.preferences.values.first.to_i
		else
			return 0
		end
	end

end