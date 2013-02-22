class ReviewsController < ApplicationController
  before_filter :require_authentication
  
  def index
    @user ||= User.find_by_username(session[:username])
    
    if @user.review_group
      @group = @user.review_group
    elsif @user.review_group_ownership
      @group = @user.review_group_ownership
    else
      render 'no_group'
    end

    unless @user.reviews.size > 0
      @group.users.each do |u|
        @user.reviews.build(:presenter => u)
        @user.save
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes(params[:review])
    @review.save!
    redirect_to reviews_url
  rescue
    flash[:error] = "Problem saving review"
    redirect_to reviews_url
  end

  def require_authentication
    unless session[:username]
      flash[:error] = "You must be logged in."
      redirect_to sessions_url
    end
  end

end
