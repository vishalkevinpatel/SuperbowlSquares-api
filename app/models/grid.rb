class Grid < ApplicationRecord
  belongs_to :user
  has_many :squares, dependent: :destroy
  has_many :users, through: :squares
  after_create :create_squares

  def create_squares
    (1..100).each do |location|
      squares.create(user_id: 1, grid_id: id, location: location)
    end
  end
end
