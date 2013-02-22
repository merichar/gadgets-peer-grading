class ReviewsController < ApplicationController
  before_filter :require_authentication
  
  def index
    @user = User.find_by_username(session[:username])
    
    if @user.review_group
      @group = @user.review_group
    elsif @user.review_group_ownership
      @group = @user.review_group_ownership
    else
      render 'no_group'
    end
    
    
  end

  def require_authentication
    unless session[:username]
      flash[:error] = "You must be logged in."
      redirect_to sessions_url
    end
  end


end
