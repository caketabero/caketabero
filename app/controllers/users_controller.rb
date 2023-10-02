class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to index_user_path(current_user) unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       @user.save
      redirect_to index_user_path(current_user)
    else
      render 'edit'
    end
  end

  def sort
    if params[:type] == 'everyone'
      @users = User.all
      @btn_classes = ['button button__active', 'button', 'button']

    elsif params[:type] == 'admin'
      @users = User.where(admin_flag: true)
      @btn_classes = ['button', 'button button__active', 'button']

    else
      @users = User.where(admin_flag: false)
      @btn_classes = ['button', 'button', 'button button__active']
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number)
  end
end