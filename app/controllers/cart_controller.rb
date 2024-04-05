class CartController < ApplicationController
  
  def show
    @cart = current_user.cart
    @render_cart = true
    @cart = current_user.cart
    @orderables = @cart.orderables if @cart.present?
    @products = Product.all
  end
  
  def item_count
    @cart = current_user.cart
    total_items = @cart.orderables.sum(:quantity) if @cart.present?
    render json: { totalItems: total_items }
  end
  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    @cart = current_user.cart
    current_orderable = @cart.orderables.find_by(product_id: @product.id) if @cart.present?
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif current_orderable
      current_orderable.update(quantity: current_orderable.quantity + quantity)
    
    elsif @cart.present?
      @cart.orderables.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
          turbo_stream.replace('cart_items')
        ]
      end
    end
  end

  def remove
    @cart = current_user.cart
    orderable = @cart.orderables.find_by(id: params[:id]) if @cart.present?
    orderable.destroy if orderable

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
          turbo_stream.replace('cart_items')
        ]
      end
    end
  end
end
