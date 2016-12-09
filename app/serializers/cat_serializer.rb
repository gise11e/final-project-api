class CatSerializer < ActiveModel::Serializer
  attributes :id, :dob, :gender, :favorite_toy, :breed, :photo, :name, :evil_index
  has_one :user
end
