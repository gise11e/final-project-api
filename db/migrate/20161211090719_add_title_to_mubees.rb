class AddTitleToMubees < ActiveRecord::Migration[5.0]
  def change
    add_column :mubees, :title, :string
  end
end
