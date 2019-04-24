module Spree
  class CloudflareController < Spree::StoreController

    include ActionView::Helpers::OutputSafetyHelper

    ## Gems: https://github.com/modosc/cloudflare-rails y https://github.com/customink/actionpack-cloudflare (+Simple)
    ## CF https://support.cloudflare.com/hc/en-us/articles/200170986
    def index
      render html: raw("<h2>Rails: OK</h2>" +
                         "<h3>Headers</h3>" +
                         "CF_IPCOUNTRY es: #{request.env['HTTP_CF_IPCOUNTRY'].to_s}" +
                         "<br/>CF_CONNECTING_IP es: #{request.env['HTTP_CF_CONNECTING_IP'].to_s}" +
                         "<br/>X-Forwarded-For es: #{request.env['HTTP_X_FORWARDED_FOR'].to_s}" +
                         "<br/>remote_ip es: #{request.remote_ip.to_s}" +
                         "<br/>ip es: #{request.ip.to_s}"
      )
    end

  end
end
