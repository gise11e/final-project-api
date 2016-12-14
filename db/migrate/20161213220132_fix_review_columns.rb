class FixReviewColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :crew_id, :sender
    rename_column :reviews, :producer_id, :recipient
  end
end
