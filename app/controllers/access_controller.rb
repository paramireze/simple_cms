class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # displat text & links
  end

  def login
    # login form
  end

  def attempt_login

    if params[:username].present? && params[:password_digest].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password_digest])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "you are now logged in."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'logged out'
    redirect_to(access_login_path)
  end
end
