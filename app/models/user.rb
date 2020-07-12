class User < ApplicationRecord
  rolify
  before_save {self.email = email.downcase}
  after_create :assign_default_role


  #user will be able to have as much posts as they want
  has_many :posts, dependent: :destroy
  
  validates :username, presence: true, length: {maximum: 50}, uniqueness: true
  
  validates :email, presence: true, uniqueness: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
                        :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
