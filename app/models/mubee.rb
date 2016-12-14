class Mubee < ApplicationRecord
  belongs_to :producer, class_name: "User", foreign_key: "producer_id"
  belongs_to :crew, class_name: "User", foreign_key: "crew_id"
  belongs_to :contract
  has_many :review

  # Get this upon initialise
  def set_current_user(c)
    @current_user = c
  end

  def can_review
    if self.deadline.nil? || self.accepted == false
      return false
    else
      return !Review.where(sender: @current_user.id, mubee_id: self.id).exists? && self.deadline <= Date.today
    end
  end

  def review_recipient_role
    @current_user.id == self.crew_id ? 'producer' : 'crew'
  end

  # def expired
  #   (Date.now - created_at) > 48.hours
  # end

end
