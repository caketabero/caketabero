class CakesController < ApplicationController
  before_action :is_admin_user?, only: [:edit, :new]

    def index
      @user = current_user
      @cakes = Cake.all
      @genre_names = Genre.all.map { |genre| genre.name }
      @genre_names
    end

    def show
      @cake = Cake.find(params[:id])
      @find_cake = Cake.new
    end

    def new
      @cake = Cake.new
    end

    def create
     @cake = Cake.new(cake_params)
      @cake.user_id = current_user.id
     if @cake.save
      redirect_to cakes_path
     else
      render :new
     end
    end

    def edit
      @cake = Cake.find(params[:id])
    end

    def update
      @cake = Cake.find(params[:id])
     if @cake.update(cake_params)
      flash[:notice] = 'Cake update successfully'
      redirect_to cakes_path(@cake)
     else
      render "edit"
     end
    end

    def destroy
      cake = Cake.find(params[:id])
      cake.update(deleted_flag: true)
      flash[:notice] = "Cake was successfully destroyed."
      redirect_to cakes_path
    end

    def sort
      genre = Genre.find_by(name: params[:pushed_button])
      if genre.name == 'All'
        @cakes = Cake.all
      else
        @cakes = Cake.where(genre_id: genre.id)
      end
      @genre_names = Genre.all.map { |genre| genre.name }
      @active_button_index = genre.id - 1
    end

    private
    def cake_params
    params.require(:cake).permit(:cake_name, :cost, :stock)
    end

    def is_admin_user?
      if !current_user.admin_flag
        redirect_to cakes_path
      end
    end
end