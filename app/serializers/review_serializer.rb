class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :sender, :recipient

  # THIS SERIALIZER ISN'T EVEN CALLED!
end
