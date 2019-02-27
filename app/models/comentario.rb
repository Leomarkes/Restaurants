class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :restaurante

  validates :description, presence: true, length: { minimum: 10, maximun: 300 }
  validates :nota, numericality: { less_than: 6, greater_than: 0 }
  validates :user_id, presence: true
  validates :restaurante_id, presence: true
end
