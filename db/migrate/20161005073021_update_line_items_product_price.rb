class UpdateLineItemsProductPrice < ActiveRecord::Migration[5.0]
  def up
    LineItem.all.each do |line_item|
       line_item.product_price= line_item.product.price
       line_item.save
    end
  end


  def down

  end  
end
