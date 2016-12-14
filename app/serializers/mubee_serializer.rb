class MubeeSerializer < ActiveModel::Serializer
  attributes :id, :crew, :producer, :accepted, :location, :brief, :contract, :budget, :title, :deadline, :can_review, :review_recipient_role

end
