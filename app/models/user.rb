class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :questions
  has_many :answers
  has_many :answered_questions, through: :answers, source: :question 
  has_many :comments
  
  mount_uploader :picture, ImageUploader
  
  #def answer(question)
    #answers.find_or_create_by(question_id: question.id)
  #end
  
  #def unanswer(question)
    #answer = answers.find_by(question_id: question.id)
    #answer.destroy if answer
  #end
  
end
