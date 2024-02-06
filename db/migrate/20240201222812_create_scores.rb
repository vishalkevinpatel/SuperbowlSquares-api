class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.string :quarter
      t.string :location
      t.integer :points

      t.timestamps
    end
  end
end
