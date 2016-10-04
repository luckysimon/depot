class Cart < ApplicationRecord
  # means when destroy one cart object,all corresponding line_items will also destroy.
  has_many :line_items, dependent: :destroy
end
