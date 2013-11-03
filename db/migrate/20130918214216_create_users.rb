class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.string :avatar
      t.string :street
      t.string :city
      t.string :province
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.timestamps
    end
  end
end
