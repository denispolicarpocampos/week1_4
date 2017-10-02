class User < ApplicationRecord
	
  has_many: likes_given, :class_name => 'Like'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
