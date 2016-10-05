class Cart < ApplicationRecord
  # means when destroy one cart object,all corresponding line_items will also destroy.
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity +=1
    else
      product = Product.find(product_id)
      current_item=line_items.build(product_id: product_id,product_price: product.price)
    end
    current_item
  end

   def total_price
     # use the sum in array to calculate the total_price. we can use the custum method,too.
    line_items.to_a.sum{ |item| item.total_price}
   end
end
