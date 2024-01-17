class SquaresSingleLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :squares, :x_location
    remove_column :squares, :y_location
    add_column :squares, :location, :integer
  end
end
