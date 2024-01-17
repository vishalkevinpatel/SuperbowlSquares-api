class CreateSquares < ActiveRecord::Migration[7.0]
  def change
    create_table :squares do |t|
      t.integer :user_id
      t.integer :grid_id
      t.integer :x_location
      t.integer :y_location

      t.timestamps
    end
  end
end
