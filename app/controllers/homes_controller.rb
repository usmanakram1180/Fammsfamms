# app/controllers/homes_controller.rb
class HomesController < ApplicationController
  def index
    @products = Product.limit(8)
  end
    def create
      @home = Home.new(home_params)
      if @home.save
        redirect_to root_path, notice: 'Thank you for subscribing!'
      else
        render :new
      end
    end
  
    private
  
    def home_params
      params.require(:home).permit(:email)
    end
  end
  