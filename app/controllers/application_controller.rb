class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_render_cart
  before_action :initialize_cart, if: :user_signed_in?

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart = current_user.cart || current_user.create_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
