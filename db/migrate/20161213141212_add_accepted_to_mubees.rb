class AddAcceptedToMubees < ActiveRecord::Migration[5.0]
  def change
    add_column :mubees, :accepted, :boolean
    remove_column :mubees, :status, :string, default: "pending"
  end
end
