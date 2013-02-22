module SessionsHelper

  def login_user( user )
    session[:username] = user.username
  end

  def logout_user
    session[:username ] = nil
  end

end
