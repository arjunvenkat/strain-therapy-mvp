class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_authorized



  def show
    @user = User.find(params[:id])
  end

  protected
    def check_if_authorized
      unless current_user.id == params[:id].to_i
        redirect_to root_url, notice: "You can only access your own user pages"
      end
    end
end
