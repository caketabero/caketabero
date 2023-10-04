class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if current_user.admin_flag == false && @user != current_user
      redirect_to users_path(current_user)
    end
#    redirect_to users_path(current_user) unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       @user.save
       flash[:notice] = "You hava update user successfully."
       redirect_to users_path
    else
       flash[:error] = "user was error create"
       render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    #@user.destroy
    user.update(deleted_flag: true)
    if user.admin_flag == true
       redirect_to :index
    else
      sign_out current_user
      redirect_to new_user_session_path
    end
  end

  def sort
    if params[:pushed_button] == '全員'
      @users = User.all
      @active_button_index = 0

    elsif params[:pushed_button] == '管理者'
      @users = User.where(admin_flag: true)
      @active_button_index = 1

    else
      @users = User.where(admin_flag: false)
      @active_button_index = 2
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number, :password)
  end
end