class HomesController < ApplicationController
  def top
    @user = current_user
    @images = []
    @image_slide_animation_array = []

# # 画像のURL作成

    5.times {|i| @images = @images << "cake.image/cake" + (i +1).to_s + ".jpg"}

# # view用の配列作成

    3.times {@image_slide_animation_array << { "image" => @images }}

    p"---------------" 
    p @image_slide_animation_array
    p"---------------"

  end
  
  
end
