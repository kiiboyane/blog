class Article < ApplicationRecord
      has_many :ratings , dependent: :destroy 
      has_many :comments , dependent: :destroy
      validates :title, presence: true,
                    length: { minimum: 5 } 
end
