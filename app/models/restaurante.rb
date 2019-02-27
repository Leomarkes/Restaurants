class Restaurante < ApplicationRecord
  has_many :comentarios, dependent: :destroy

end
