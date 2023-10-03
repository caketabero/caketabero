class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path(current_user) unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       @user.save
       flash[:notice] = "You hava update user successfully."
       redirect_to users_path(current_user)
    else

       flash[:error] = "user was error create"
      render :edit
    end  

      render 'edit'
  end

  def sort
    @type = params[:commit]

    if @type == '全員'
      @users = User.all
    elsif @type == '顧客'
      @users = User.where(admin_flag: false)
    else
      @users = User.where(admin_flag: true)
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :telephone_number)
  end
end