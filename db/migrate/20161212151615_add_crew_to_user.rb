class AddCrewToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :crew, :boolean
  end
end
