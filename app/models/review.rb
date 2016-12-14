class Review < ApplicationRecord
  belongs_to :mubee
  belongs_to :user, foreign_key: "sender", class_name: "User"
  belongs_to :user, foreign_key: "recipient", class_name: "User"

  def sender_name
    User.where(id: self.sender).pluck(:full_name)
  end
end
