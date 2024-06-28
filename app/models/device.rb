class Device < ApplicationRecord
  belongs_to :user

  validates :device_name, :device_token, presence: true

end

