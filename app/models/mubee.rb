class Mubee < ApplicationRecord
  belongs_to :producer, class_name: "User", foreign_key: "producer_id"
  belongs_to :crew, class_name: "User", foreign_key: "crew_id"
  belongs_to :contract

  # def expired
  #   (Date.now - created_at) > 48.hours
  # end

end
