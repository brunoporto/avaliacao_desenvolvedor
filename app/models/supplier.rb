class Supplier < ActiveRecord::Base
  validates :name, presence: true
  has_many :imports
end
