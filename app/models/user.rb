class User < ApplicationRecord

  include PgSearch
  multisearchable against: [:name, :username, :email]

  has_many :likes_given, :class_name => 'Like'
  has_many :tweets
  has_many :connections
  has_many :followees, through: :connections
  validates :username, uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def card_content
    %W{
      @#{self.username}
      #{self.name}
      #{self.email}
    }
  end
  # instead of deleting, indicate the user requested a delete & timestamp it  
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !deleted_at  
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end  

  def reactivate_user  
    update_attribute(:deleted_at, nil)
  end 

end
