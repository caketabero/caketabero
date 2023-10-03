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
      #render 'edit'
  end
  
  def destroy
    user = User.find(params[:id])
    #@user.destroy
    user.update(deleted_flag: true)
    user.save
    if user.admin_flag == true
       redirect_to :index
    else
      redirect_to new_user_session_path
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
    params.require(:user).permit(:name, :email, :telephone_number, :password)
  end
end