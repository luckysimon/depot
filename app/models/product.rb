class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  #validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates_numericality_of :price , :greater_than_or_equal_to => 0.01
  validates_uniqueness_of :title
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  #Playtime
  validates_length_of :title,minimum: 10, too_short: "The title is too short!!"




  def self.latest
    Product.order(:updated_at).last
  end
end
