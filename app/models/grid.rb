class Grid < ApplicationRecord
  belongs_to :user
  has_many :squares
  has_many :users, through: :squares
end
