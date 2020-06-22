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
  has_many :favorites
  has_many :likes, through: :favorites, source: :answer
  has_many :messages
  has_many :sent_messages, through: :messages, source: :receive_user
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receive_user_id'
  has_many :received_messages, through: :reverses_of_message, source: :user
  
  mount_uploader :picture, ImageUploader
  
  def favorite(answer)
    favorites.find_or_create_by(answer_id: answer.id)
  end
  
  def unfavorite(answer)
    favorite = favorites.find_by(answer_id: answer.id)
    favorite.destroy if favorite
  end
  
  def like?(answer)
    self.likes.include?(answer)
  end
    
  
  #def answer(question)
    #answers.find_or_create_by(question_id: question.id)
  #end
  
  #def unanswer(question)
    #answer = answers.find_by(question_id: question.id)
    #answer.destroy if answer
  #end
  
end
