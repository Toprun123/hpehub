class CreateForums < ActiveRecord::Migration[8.0]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps
    end
  end
end
