class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create
end
