require 'faker'
namespace :fake do
  desc "Create fake review data"
  task reviews: :environment do
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
          ailment.update_user_ailment_count
      end
    end
    puts "There are #{Review.count} fake reviews in the database"
  end
end
