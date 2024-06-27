class Watch < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :reviews

  validates :name, :brand, :price, :description, :condition, presence: true

end
