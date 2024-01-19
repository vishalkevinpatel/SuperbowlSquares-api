class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :grids
  has_many :squares
  has_many :grids, through: :squares
end
