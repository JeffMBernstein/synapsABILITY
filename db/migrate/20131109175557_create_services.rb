class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :phone
      t.text :description
      t.string :email
      t.integer :service_id
      t.string :website
      t.string :street
      t.string :city
      t.string :province
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.string :tag

      t.timestamps
    end
  end
end
