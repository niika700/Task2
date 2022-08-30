class Book < ApplicationRecord
  has_one_attached :image_processing

  validates :title, presence: true
  validates :body, presence:true
end
