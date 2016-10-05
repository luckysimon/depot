class Product < ApplicationRecord
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  #validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates_numericality_of :price , :greater_than_or_equal_to => 0.01, :less_than_or_equal_to => 1000
  validates_uniqueness_of :title
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates_uniqueness_of :image_url

  #Playtime
  validates_length_of :title,minimum: 10, too_short: "The title is too short!!"

  has_many :line_items
  # before_destroy :ensure_not_referenced_by_any_line_item


  # Class method
  def self.latest
    Product.order(:updated_at).last
  end

  private
  # Instance method
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      # The error is set to associate to the base object
      errors.add(:application_record,'Line Items present')
      return false
    end
  end
end
