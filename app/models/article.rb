class Article < ApplicationRecord
    # relacion articulo-usuario
    belongs_to :user
    # Relacion comentarios-articulo
    has_many :comments

    # Validacion de presencia de titulo y contenido del articulo
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 10}
    validates :content, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 50}
    # Seteo de visitas a cero
    before_save :set_visits

   def update_visits
        self.visits ||= 0
        self.update(visits: self.visits+1)
   end
   

    private
    def set_visits
        self.visits ||= 0
    end
    
end
