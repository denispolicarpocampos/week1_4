class Connection < ApplicationRecord
    belongs_to :user
    belongs_to :followee, :class_name => 'User'
    validates :user_id, uniqueness: { scope: :followee_id }
end
