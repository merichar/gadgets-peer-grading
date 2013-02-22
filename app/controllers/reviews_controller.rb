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
        @user.reviews.build(:presenter => u,
                            :implementation_score => 5,
                            :degree_of_difficulty_score => 5,
                            :coolness_score => 5 )

        @user.save
      end
    end
  rescue
    flash[:error] = "Something went wrong."
    redirect_to sessions_url
  end

  def edit
    @review = Review.find(params[:id])
    unless @review and @review.reviewer.username == session[:username]
      redirect_to reviews_url
    end
  rescue 
    redirect_to reviews_url
  end

  def update
    @review = Review.find(params[:id])
    unless @review and @review.reviewer.username == session[:username]
      redirect_to reviews_url
    end
    @review.update_attributes(params[:review])
    @review.save!
    redirect_to reviews_url
  rescue
    flash[:error] = "Problem saving review"
    render 'edit'
  end

  def require_authentication
    unless session[:username]
      flash[:error] = "You must be logged in."
      redirect_to sessions_url
    end
  end

end
