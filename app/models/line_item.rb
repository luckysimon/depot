class LineItem < ApplicationRecord
  # In Rails 5. When you tried to save a model which the belongs_to association is not set, it will trigger validation error.
  # With a default setting config.active_record.belongs_to_required_by_default = true
  # To disable it in particular case, add optional:true 
  belongs_to :order   ,optional: true
  belongs_to :product ,optional: true
  belongs_to :cart

  def total_price
    product.price* quantity
  end
end
