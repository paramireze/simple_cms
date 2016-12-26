class AdminUsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  layout "admin"

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.create(admin_user_params)
    if @admin_user.save
      redirect_to(admin_users_path)
    else
      @admin_user
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password_digest)
  end
end
