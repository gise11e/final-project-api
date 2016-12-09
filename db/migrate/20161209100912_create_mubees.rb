class CreateMubees < ActiveRecord::Migration[5.0]
  def change
    create_table :mubees do |t|
      t.integer :crew_id
      t.integer :producer_id
      t.references :contract, foreign_key: true
      t.boolean :accepted
      t.string :location
      t.float :lat
      t.float :lng
      t.text :brief
      t.integer :budget
      t.timestamps
    end
  end
end
