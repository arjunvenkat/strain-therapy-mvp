class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:username]

  validates_presence_of    :password, :on=>:create
  validates_confirmation_of    :password, :on=>:create
  validates_length_of    :password, :within => Devise.password_length, :allow_blank => true

  has_many :user_ailments
  has_many :ailments, through: :user_ailments
  has_many :reviews
  has_many :products, through: :reviews

  scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }

  def alphabetical_user_ailments
    user_ailments.joins(:ailment).order('ailments.name asc')
  end

  def distinct_products
    products.distinct
  end

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
