class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :ailment
  belongs_to :user
end
