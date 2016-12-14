class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.float :rating
      t.integer :crew_id
      t.integer :producer_id
      t.references :mubee, foreign_key: true

      t.timestamps
    end
  end
end
