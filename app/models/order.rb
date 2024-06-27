class Order < ApplicationRecord
  belongs_to :user
  belongs_to :watch

  validates :total_price, :status, presence: true
end
