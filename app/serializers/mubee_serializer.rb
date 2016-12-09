class MubeeSerializer < ActiveModel::Serializer
  attributes :id, :crew_id, :producer_id, :accepted, :location, :brief, :contract, :budget
end
