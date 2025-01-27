class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :forum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps
    end
  end
end
