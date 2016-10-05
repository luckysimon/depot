class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |k,v|
        if v > 1
          cart.line_items.where(product_id:k).delete_all
          combined_item=cart.line_items.build(product_id:k)
          combined_item.quantity = v
          combined_item.save
        end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      quantity= line_item.quantity
      quantity.times do
        separate_item= LineItem.create(product_id:line_item.product_id,cart_id:line_item.cart_id)
        # quantity default 1
      end
      line_item.destroy
    end
  end
end
