require 'prawn/layout'

@font_face = Spree::PrintInvoice::Config[:print_invoice_font_face]

font @font_face

im = Sprockets::Railtie.build_environment(Rails.application).find_asset(Spree::PrintInvoice::Config[:print_invoice_logo_path])
image im.filename , :at => [200,720], :scale => 0.1 #if im.present?

render :partial => "header"

move_down 35

render :partial => "address"

move_down 5

render :partial => "line_items_box"

move_down 8

render :partial => "totals"

# Footer
render :partial => "footer"