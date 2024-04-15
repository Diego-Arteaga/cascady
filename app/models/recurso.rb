class Recurso < ApplicationRecord
    has_one_attached :imagen
    validates :title, presence: true
    validates :imagen, presence:true
end
