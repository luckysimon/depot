class Order < ApplicationRecord
  # enum pay_type: {
  #    "Check"          => 0,
  #    "Credit Card"    => 1,
  #    "Purchase Order" => 2
  # }
  belongs_to :payment_type

  validates :name,:address,:email,presence: true
  validates :payment_types, presence: true
  # validates :pay_type,inclusion: pay_types.keys
  has_many :line_items,dependent: :destroy


  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      # order.line_items inserts the current line_item
      line_items << line_item
    end
  end
end
