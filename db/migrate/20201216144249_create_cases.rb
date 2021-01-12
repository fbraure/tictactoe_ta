class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.integer :row
      t.integer :col
      t.integer :value
      t.timestamps
    end
  end
end
