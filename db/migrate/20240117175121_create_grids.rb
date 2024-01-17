class CreateGrids < ActiveRecord::Migration[7.0]
  def change
    create_table :grids do |t|
      t.string :code
      t.integer :user_id

      t.timestamps
    end
  end
end
