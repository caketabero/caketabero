class CakesController < ApplicationController
  before_action :is_admin_user?, only: [:edit, :new]
  skip_before_action :verify_authenticity_token

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
      @genres = Genre.all
      select_genres = @genres.pluck(:name)
      select_genres.shift

      @select_array = []
      select_genres.each do |genre_name|
          genre_array = [genre_name, genre_name]
          @select_array.push(genre_array)
     end
      #@select_genres =  selecselect_genres.shiftt_genres
    end

    def create
    case params[:cake][:genre_id]
    when "ケーキ" then
     params[:cake][:genre_id] = 2
     @genre_id = params[:cake][:genre_id]
    when "タルト" then
     params[:cake][:genre_id] = 3
     @genre_id = params[:cake][:genre_id]
    when "チョコレート系" then
     params[:cake][:genre_id] = 4
     @genre_id = params[:cake][:genre_id]
    when "季節系" then
     params[:cake][:genre_id] = 5
     @genre_id = params[:cake][:genre_id]
    when "その他" then
     params[:cake][:genre_id] = 6
     @genre_id = params[:cake][:genre_id]
    when "未選択" then
     params[:cake][:genre_id] = 7
     @genre_id = params[:cake][:genre_id]
    end
     @cake = Cake.new(
       cake_name:params[:cake][:cake_name],
       cost:params[:cake][:cost],
       stock:params[:cake][:stock],
       explanation:params[:cake][:explanation],
       created_name:params[:cake][:created_name],
       updated_name:params[:cake][:updated_name],
       user_id:current_user.id,
       genre_id:@genre_id,
       )
      # @select_genres = @genre_id
     if @cake.save
      redirect_to cakes_path
     else
      render 'new'
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

    def stock_adjustment
      cakes_id = params[:cakes_id]
      cakes_id.each do |cake_id|
        cake = Cake.find(cake_id)
        cake.update(stock: cake.stock - 1)
        # cake.save
      end
      # redirect_to thanks_path
    end

    private
    def cake_params
     params.require(:cake).permit(:cake_name, :cost, :stock, :genre_id, :explanation, :created_name, :updated_name)
    end

    def is_admin_user?
      if !current_user.admin_flag
        redirect_to cakes_path
      end
    end
end