class Review < ApplicationRecord
  belongs_to :user
  belongs_to :watch

  validates :rating, :comment, presence: true

end
