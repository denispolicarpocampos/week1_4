class User < ApplicationRecord
  has_many :tweets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
