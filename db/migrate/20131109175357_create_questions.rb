class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.integer :upvote
      t.references :comment

      t.timestamps
    end
  end
end
