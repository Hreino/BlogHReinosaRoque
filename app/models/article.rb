class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 20}
    validates :content, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 50}
    
    
end
