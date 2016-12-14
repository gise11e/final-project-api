class AddDeadlineToMubees < ActiveRecord::Migration[5.0]
  def change
    add_column :mubees, :deadline, :date
  end
end
