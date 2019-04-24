#### https://2bedigital.atlassian.net/browse/PROY-434
# https://gorails.com/episodes/intro-to-importing-from-csv
# https://www.culttt.com/2016/04/20/working-csvs-ruby/

require 'csv'
namespace :import do

  desc "Import users from csv"
  task user: :environment do
    filename = File.join Rails.root, 'direcciones_clientes.csv'
    counter = 0

    CSV.foreach(filename, encoding:'utf-8', col_sep: ',', headers: true, header_converters: :symbol) do |row|
      p row

      begin
      ActiveRecord::Base.transaction do

        user = Spree::User.create!(email: row[:email], password: "oldiesfloren2018")

        case row[:name_country]
        when "Italia"
          country = Spree::Country.find_by(name: "Italy")
        when "Irlanda"
          country = Spree::Country.find_by(name: "Ireland")
        else
          country = Spree::Country.find_by(name: "Spain")
        end

        state = Spree::State.find_by(name: row[:city]) || Spree::State.find_by(name: "Barcelona")

        telephone = (row[:phone_mobile].present?)? row[:phone_mobile] : row[:phone]
        telephone = '666' if telephone.blank?

        addressh = {firstname: row[:firstname],
                    lastname: row[:lastname],
                    address1: row[:address1],
                    address2: row[:address2],
                    city: ((row[:city].present?)? row[:city]:'Unknown'),
                    country_id: country.id,
                    phone: telephone,
                    created_at: "2017-12-31",
                    zipcode: ((row[:postcode].present?)? row[:postcode]: "08028"),
                    state_id: state.id}

        #address = user.addresses.create!(addressh)
        address = Spree::Address.create!(addressh)
        usera = Spree::UserAddress.create!(user_id: user.id, address_id: address.id, default: '1')

        counter +=1
      end
      rescue Exception => ex
        p ex
      end

    end
    puts "Imported #{counter} users"

  end
end
