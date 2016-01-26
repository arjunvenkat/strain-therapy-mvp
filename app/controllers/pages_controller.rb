class PagesController < ApplicationController
  def home
    render :layout => 'home'
  end

  def splash
    render :layout => 'home'
  end
end
