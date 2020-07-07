class User < ApplicationRecord
  before_save {self.email = email.downcase}

  #user will be able to have as much posts as they want
  has_many :posts
  
  validates :username, presence: true, length: {maximum: 50}, uniqueness: true
  
  validates :email, presence: true, uniqueness: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
