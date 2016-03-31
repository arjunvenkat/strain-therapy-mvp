require 'csv'
namespace :import do
  desc "Imports ailment and scientific evidence data from a CSV"
  task ailments: :environment do
    CSV.foreach("#{Rails.root}/db/data/ailments.csv", headers: true) do |row|
      a = Ailment.create( name: row[0], link: row[1])
      ScientificEvidence.create(
          ailment_id: a.id,
          link: row[8],
          description: row[9],
          featured: true
        )
    end
    puts "There are #{Ailment.count} ailments in the database"
    puts "There are #{ScientificEvidence.count} pieces of scientific evidence in the database"
  end

  desc "Imports dispensary data from a CSV"
  task dispensaries: :environment do
    CSV.foreach("#{Rails.root}/db/data/dispensaries.csv", headers: true) do |row|
      Dispensary.create(
          llc_name: row[0],
          name: row[1],
          code: row[2],
          address: row[3],
          city: row[4],
          zip: row[5]
        )
    end
    puts "There are #{Dispensary.count} dispensaries in the database"
  end

  desc "Imports product data from a CSV"
  task products: :environment do
    CSV.foreach("#{Rails.root}/db/data/products.csv", headers: true) do |row|
      # puts row[0]
      # csv_category = row[0].downcase
      # if csv_category == 'food' || csv_category == 'beverage' || csv_category == 'topical'
      #   category = 'edibles'
      # elsif csv_category == 'vape' || csv_category == 'tincture' || csv_category == 'tinctures'
      #   category = 'concentrates'
      # elsif csv_category == 'smoke' || csv_category == 'vape'
      #   category = 'flowers'
      # else
      #   category = csv_category
      # end
      Product.create(
          category: row[0].downcase,
          name: row[1]
        )
    end
    puts "There are #{Product.count} products in the database"
  end
end
