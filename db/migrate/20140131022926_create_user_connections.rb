class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
    	t.integer :user_id
    	t.integer :connection_id
    	t.integer :connection_status, :default => 0

      t.timestamps
    end

    add_index :user_connections, [:user_id, :connection_id]
  end
end
