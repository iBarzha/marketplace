class User < ApplicationRecord


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :watches
  has_many :orders
  has_many :reviews
  has_many :devices

  validates :name, presence: true
end

