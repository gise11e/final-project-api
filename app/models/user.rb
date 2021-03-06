class User < ApplicationRecord
  has_many :mubees, class_name: "Mubee", foreign_key: "crew_id"
  has_many :requests, class_name: "Mubee", foreign_key: "producer_id"
  has_and_belongs_to_many :skills

  has_many :reviews_as_crew, class_name: "Review"
  def reviews_as_crew
    Review.joins(:mubee).where(recipient: self.id, mubees: { crew_id: self.id })
  end

  def avg_rating_as_crew

    return nil if reviews_as_crew.length == 0

    (reviews_as_crew.reduce(0) do |sum, review|
      sum + review.rating
    end / reviews_as_crew.length).round
  end

  has_many :reviews_as_producer, class_name: "Review"
  def reviews_as_producer
    Review.joins(:mubee).where(recipient: self.id, mubees: { producer_id: self.id })
  end

  def avg_rating_as_producer

    return nil if reviews_as_producer.length == 0

    (reviews_as_producer.reduce(0) do |sum, review|
      sum + review.rating
    end / reviews_as_producer.length).round
  end

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  # validates :facebook_id

  mount_uploader :image, ImageUploader

  geocoded_by :location
  after_validation :geocode


end
