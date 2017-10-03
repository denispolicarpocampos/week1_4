class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.references :user
      t.references :followee, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
