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
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])

    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = 'Admin User updated'
      redirect_to(admin_users_path)
    else
      flash.now[:notice] = "Error updating admin user"
      render('edit')
    end

  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.destroy
      flash[:notice] = "Admin User Destroyed!"
    else
      flash[:notice] = "Failed to destroy the user"
      render('delete')
    end
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username)
  end
end
