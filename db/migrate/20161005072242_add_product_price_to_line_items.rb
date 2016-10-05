class AddProductPriceToLineItems < ActiveRecord::Migration[5.0]
  def up
    add_column :line_items, :product_price, :decimal
  end

  def down
    remove_column :line_items, :product_price
  end

end
