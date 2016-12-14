class UserSerializer < ActiveModel::Serializer
  has_many :skills
  attributes :id, :username, :email, :location, :website, :full_name, :image, :crew, :latitude, :longitude, :requests, :mubees, :reviews_as_crew, :reviews_as_producer

  def image
    object.image.url
  end
end
