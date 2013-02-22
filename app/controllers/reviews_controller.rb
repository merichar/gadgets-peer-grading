class ReviewsController < ApplicationController

  def index
    @user = User.find_by_username(session[:username])

    
  end


end
