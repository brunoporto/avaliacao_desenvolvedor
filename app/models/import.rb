class Import < ActiveRecord::Base
  validates :buyer, :description, :price, :quantity, :address, :supplier, presence: true

  belongs_to :buyer
  belongs_to :supplier
end
