class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :image
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :location
      t.float :lat
      t.float :lng
      t.string :website

      t.timestamps
    end
  end
end
