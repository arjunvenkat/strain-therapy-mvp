class UserAilment < ActiveRecord::Base
  belongs_to :ailment
  belongs_to :user

  def reviews
    Review.where(user_id: user_id, ailment_id: ailment_id)
  end
end
