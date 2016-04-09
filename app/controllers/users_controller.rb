class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_authorized



  def show
    @user = User.find(params[:id])
    @product = Product.find_by(id: params[:product_id])
    if @product.present?
      @reviews = @user.reviews_by_rating.where(product_id: @product.id)
    else
      @reviews = @user.reviews_by_rating
    end
    if params[:sort_by].present?
      @reviews = @reviews.order(params[:sort_by])
    end

  end

  def update_preferences
    @user = User.find(params[:id])
    @user.preferred_method = params[:method]
    @user.zodiac_sign = params[:sign]
    if @user.save
      redirect_to @user
    else
      render 'show'
    end
  end

  protected
    def check_if_authorized
      unless current_user.id == params[:id].to_i
        redirect_to root_url, notice: "You can only access your own user pages"
      end
    end
end
