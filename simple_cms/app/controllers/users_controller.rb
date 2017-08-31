class UsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_user, :only => [:edit, :update, :delete, :destroy]

  def index
    @users = User.sorted
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully!"
      redirect_to(users_path)
    else
      render('new')
    end

  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated successfully!"
      redirect_to(users_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    flash[:notice] = "User destroyed successfully!"
    redirect_to(users_path)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
