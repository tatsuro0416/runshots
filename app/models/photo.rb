class Photo < ApplicationRecord
  validates :image, presence: true
  
  belongs_to :post
end
