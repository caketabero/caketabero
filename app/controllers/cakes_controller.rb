class CakesController < ApplicationController
    def index
      @user = current_user
      # @cakes = Cake.all
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
      @cake = Cake.find(params[:id])
      @cake.destroy
      redirect_to cakes_path
      flash[:notice] = "Cake was successfully destroyed."
    end

      def cake_params
        params.require(:cake).permit(:cake_name, :cost, :stock)
      end
end



