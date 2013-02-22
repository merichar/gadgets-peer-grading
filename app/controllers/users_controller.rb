class UsersController < ApplicationController
  # TODO: cleanup the filter cludge

  include SessionsHelper

  before_filter :check_andrewid, :check_if_registered, :check_for_default_username, only: 'create'

  def index
    redirect_to sessions_url
  end

  def create
    @user ||= User.find_by_andrewid(params[:user][:andrewid])

    # Ok, they made it this far, let them update their grader alias
    @user.username = params[:user][:username]
    if @user.save
      login_user @user
      flash[:notice] = "Welcome, foo."
      redirect_to reviews_url
    else
      flash[:error] = "Hold on there, skipper."
      render 'new'
    end
  end


  private
  
  # Andrew ID cannot be blank
  def check_andrewid
    if params[:user][:andrewid] == ""
      flash[:error] = "AndrewID cannot be blank"
      redirect_to sessions_url
    end
  end

  # All users are pre-created, and thus exist
  def check_if_registered
    @user ||= User.find_by_andrewid(params[:user][:andrewid])
    unless @user
      flash[:error] = "User \"" + params[:user][:andrewid] + "\" is not registered."
      redirect_to sessions_url
    end
  end

  # Only register people with unchanged usernames
  def check_for_default_username
    @user ||= User.find_by_andrewid(params[:user][:andrewid])
    unless @user.username == @user.andrewid
      flash[:error] = "This user is already registered."
      redirect_to sessions_url
    end
  end

end
