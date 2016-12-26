class AccessController < ApplicationController
  layout 'admin'
  def menu
    # displat text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "you are now logged in."
      redirect_to(admin_path)
    else
      flash.new[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'logged out'
    redirect_to(access_login_path)
  end
end
