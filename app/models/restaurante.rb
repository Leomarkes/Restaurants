class Restaurante < ApplicationRecord
  has_many :comentarios, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  mount_uploader :image, ImageUploader

end
