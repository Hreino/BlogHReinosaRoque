class Article < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 20}
    validates :content, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 50}
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
