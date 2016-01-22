class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:username]

  validates_presence_of    :password, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true

  has_many :user_ailments
  has_many :reviews

  def reviews_by_rating
    reviews.order(effectiveness: :desc)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
