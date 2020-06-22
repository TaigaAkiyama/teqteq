class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :favorites
end
