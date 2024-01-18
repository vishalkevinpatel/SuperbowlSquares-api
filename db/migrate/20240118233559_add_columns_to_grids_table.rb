class AddColumnsToGridsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :grids, :rows_digit, :integer
    add_column :grids, :columns_digit, :integer
  end
end
