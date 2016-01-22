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
end
