class User < ApplicationRecord
  has_many :tasks 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  
  enum role: { 
    admin: 1, 
    member: 2
  }
  
 validates :first_name, :last_name, presence: true
 validates_uniqueness_of :email 
end
