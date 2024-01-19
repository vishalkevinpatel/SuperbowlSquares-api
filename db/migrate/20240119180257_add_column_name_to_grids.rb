class AddColumnNameToGrids < ActiveRecord::Migration[7.0]
  def change
    add_column :grids, :name, :string
  end
end
