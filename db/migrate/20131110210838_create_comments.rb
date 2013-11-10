class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :upvote
      t.integer :downvote
      t.references :question, index: true

      t.timestamps
    end
  end
end
