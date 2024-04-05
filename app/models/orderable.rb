class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    product&.price.to_d * quantity.to_i
  end
end
