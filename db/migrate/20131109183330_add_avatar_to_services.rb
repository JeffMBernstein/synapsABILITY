class AddAvatarToServices < ActiveRecord::Migration
  def change
    add_column :services, :avatar, :string
  end
end
