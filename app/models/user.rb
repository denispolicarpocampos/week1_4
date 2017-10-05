class User < ApplicationRecord

  include PgSearch
  multisearchable against: [:name, :username, :email]
	
  has_many :likes_given, :class_name => 'Like'
  has_many :tweets
  has_many :connections
  has_many :followees, through: :connections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def card_content
    %W{
      @#{self.username}
      #{self.name}
      #{self.email}
    }
  end

end
