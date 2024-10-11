class RelacionBiblioteca < ApplicationRecord
  belongs_to :biblioteca
  belongs_to :libro
end
