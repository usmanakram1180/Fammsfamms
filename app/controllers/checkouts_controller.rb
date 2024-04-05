class CheckoutsController < ApplicationController
    def index
      @cart = current_user.cart
      # Assuming you have logic to calculate the discount and shipping cost
      discount = 10.00
      shipping_cost = 14.00
      subtotal = @cart.orderables.sum(&:total)
      total_price = subtotal - discount + shipping_cost
      
      # Pass necessary variables to the view
      @subtotal = subtotal
      @discount = discount
      @shipping_cost = shipping_cost
      @total_price = total_price
    end
  end
  