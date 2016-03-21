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
end
