class CakesController < ApplicationController
    def index
        
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
    
    private
    def cake_params 
      params.require(:cake).permit(:product_name, :price, :stock)     
    end
end 
