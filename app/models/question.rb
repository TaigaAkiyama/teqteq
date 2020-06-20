class Question < ApplicationRecord
  
  belongs_to :user
  has_many :answers
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 300 }
  
   mount_uploader :picture, ImageUploader
end
