class Comment < ApplicationRecord
  # Relacion comentario-usuario y comentario-articulo
  belongs_to :user
  belongs_to :article
end
