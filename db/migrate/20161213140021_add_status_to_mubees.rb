class AddStatusToMubees < ActiveRecord::Migration[5.0]
  def change
    add_column :mubees, :status, :string, default: "pending"
    remove_column :mubees, :accepted, :boolean
  end
end
