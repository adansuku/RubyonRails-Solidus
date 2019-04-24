Spree::AppConfiguration.class_eval do
  preference :selling_zone, :array, default: ["AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "FI", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "NL", "PL", "RO", "SE", "SI", "SK", "MT", "PT"]
  preference :invoice_payment_id, :integer, default: 3
  preference :invoice_payment_class, :string, default: "Spree::BillingIntegration::RedsysPayment"
end