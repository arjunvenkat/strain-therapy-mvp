class Product < ActiveRecord::Base
  has_many :reviews

  def name_with_category
    "#{name} - #{category}"
  end

  def reviews_by_rating
    reviews.order(effectiveness: :desc)
  end

  def best_ailments(limit=5)
    ailments = Hash.new {|hash,key| hash[key] = []}
    reviews_by_rating.each do |review|
      ailment_name = "#{review.ailment_id}-#{review.ailment.name}"
      ailments[ailment_name] = ailments[ailment_name].push(review.effectiveness)
    end
    ailments.each do |key,val_array|
      ailments[key] = (val_array.sum.to_f/val_array.count).round(1)
    end
    ailment_array = ailments.sort_by { |key, val| val }.reverse.take(limit)
    ailment_array.map do |array_item|
      [Ailment.find(array_item[0].to_i), array_item[1]]
    end
  end

  def avg_rating
    reviews.average(:effectiveness).to_i
  end
end
