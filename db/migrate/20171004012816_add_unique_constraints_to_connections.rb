class AddUniqueConstraintsToConnections < ActiveRecord::Migration[5.1]
  def change
    add_index :connections, [:user_id, :followee_id], unique: true
  end
end
