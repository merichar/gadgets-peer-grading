class SessionsController < ApplicationController
  include SessionsHelper

  before_filter :check_if_logged_in, except: 'logout'

  def index
    @user = User.new
  end

  def login
    @user = User.find_by_username(params[:user][:username])
    
    if @user
      
      if @user.username == @user.andrewid
        flash[:error] = "You must register first."
        redirect_to sessions_url
      else
        login_user @user
        redirect_to reviews_url
      end

    else
      flash[:error] = "That grader alias is not registered."
      redirect_to sessions_url
    end
  end

  def logout
    logout_user
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end

  private
  def check_if_logged_in
    if session[:username]
      redirect_to reviews_url
    end
  end

end
