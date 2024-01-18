class ChangeColumnTypeInGridsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :grids, :rows_digit, :string
    change_column :grids, :columns_digit, :string
  end
end
