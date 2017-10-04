class User < ApplicationRecord
	
  has_many :likes_given, :class_name => 'Like'
  has_many :tweets
  has_many :connections
  has_many :followees, through: :connections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
