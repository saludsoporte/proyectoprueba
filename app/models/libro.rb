class Libro < ApplicationRecord
  belongs_to :autor
  has_many :relacion_bibliotecas
end
