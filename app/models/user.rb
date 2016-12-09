class User < ApplicationRecord
  has_many :mubees, class_name: "Mubee", foreign_key: "crew_id"
  has_many :requests, class_name: "Mubee", foreign_key: "producer_id"
  has_and_belongs_to_many :skills

  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create

  mount_uploader :image, ImageUploader
end
