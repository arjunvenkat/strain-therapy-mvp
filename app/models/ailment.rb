class Ailment < ActiveRecord::Base
  has_many :reviews
  has_many :scientific_evidences
  has_many :user_ailments
  has_many :users, through: :user_ailments

  scope :by_popularity, -> { order('user_ailment_count desc') }

  def short_name
    name.split.length > 1 ? name.split[0] : name
  end

  def reviews_by_rating
    reviews.order(effectiveness: :desc)
  end

  def update_user_ailment_count
    self.user_ailment_count = user_ailments.count
    self.save
  end

  def best_products(limit)
    products = Hash.new {|hash,key| hash[key] = []}
    reviews_by_rating.each do |review|
      product_name = "#{review.product.id}-#{review.product.name}"
      products[product_name] = products[product_name].push(review.effectiveness)
    end
    products.each do |key,val_array|
      products[key] = (val_array.sum.to_f/val_array.count).round(1)
    end
    product_array = products.sort_by { |key, val| val }.reverse.take(limit)
    product_array.map do |array_item|
      [Product.find(array_item[0].to_i), array_item[1]]
    end
  end

  def featured_evidence
    scientific_evidences.find_by(featured: true)
  end


  def other_evidence
    scientific_evidences.where(featured: !true).limit(10)
  end
end
