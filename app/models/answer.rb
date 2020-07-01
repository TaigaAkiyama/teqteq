class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :favorites, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 255 }
end
