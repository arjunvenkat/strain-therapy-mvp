# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create(username: 'test', password: '12341234', password_confirmation: '12341234')
User.create(username: 'russ', password: '12341234', password_confirmation: '12341234')
User.create(username: 'arjun', password: '12341234', password_confirmation: '12341234')
puts "There are #{User.count} users in the database"

Ailment.destroy_all
ScientificEvidence.destroy_all
CSV.foreach("#{Rails.root}/db/data/ailments.csv", headers: true) do |row|
  a = Ailment.create( name: row[0], link: row[1])
  ScientificEvidence.create(
      ailment_id: a.id,
      link: row[8],
      description: row[9],
      featured: true
    )
  (rand(5)+1).times do
    ScientificEvidence.create(
        ailment_id: a.id,
        link: "http://google.com",
        description: Faker::Lorem.paragraph,
      )
  end
end
puts "There are #{Ailment.count} ailments in the database"
puts "There are #{ScientificEvidence.count} pieces of scientific evidence in the database"

Product.destroy_all
Product.create(name: "Blue Dream " , strain_type: "Hybrid", category: "concentrates")
Product.create(name: "Sour Diesel" , strain_type: "Sativa", category: "concentrates")
Product.create(name: "OG Kush" , strain_type: "Hybrid", category: "concentrates")
Product.create(name: "Girl Scout Cookies " , strain_type: "Hybrid", category: "concentrates")
Product.create(name: "Grand Daddy Purple " , strain_type: "Indica", category: "concentrates")
Product.create(name: "White Widow" , strain_type: "Hybrid", category: "concentrates")
Product.create(name: "Jack Herer " , strain_type: "Sativa", category: "concentrates")
Product.create(name: "Bubba Kush " , strain_type: "Indica", category: "flowers")
Product.create(name: "Train Wreck" , strain_type: "Hybrid", category: "flowers")
Product.create(name: "AK 47" , strain_type: "Hybrid", category: "flowers")
Product.create(name: "Bluecheese " , strain_type: "Indica", category: "flowers")
Product.create(name: "Green Crack" , strain_type: "Sativa", category: "flowers")
Product.create(name: "Pineapple Express" , strain_type: "Hybrid", category: "flowers")
Product.create(name: "Purple Kush" , strain_type: "Indica", category: "edibles")
Product.create(name: "Northern Lights" , strain_type: "Indica", category: "edibles")
Product.create(name: "Headband " , strain_type: "Hybrid", category: "edibles")
Product.create(name: "Alaskan Thunderfuck" , strain_type: "Sativa", category: "edibles")
Product.create(name: "Bubble Kush" , strain_type: "Indica", category: "edibles")
Product.create(name: "Blackberry Kush" , strain_type: "Indica", category: "edibles")
Product.create(name: "Lemon Haze " , strain_type: "Sativa", category: "edibles")
Product.create(name: "Super Silver Haze" , strain_type: "Sativa", category: "edibles")
puts "There are #{Product.count} products in the database"

Review.destroy_all
Product.all.each do |product|
  rand(4..20).times do
      user = User.offset(rand(User.count)).first
      ailment = Ailment.offset(rand(Ailment.count)).first
      Review.create(
        user_id: user.id,
        ailment_id: ailment.id,
        product_id: product.id,
        method: CONSUMPTION_METHODS.sample,
        amount: 0.3,
        effectiveness: rand(4) + 1,
        positives: Faker::Hacker.say_something_smart,
        negatives: Faker::Hacker.say_something_smart,
        additional_info: Faker::Hacker.say_something_smart)
      UserAilment.find_or_create_by(user_id: user.id, ailment_id: ailment.id)
  end
end

