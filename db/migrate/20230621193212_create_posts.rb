class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.string :Title
      t.text :Text
      t.datetime :CreatedAt
      t.datetime :UpdatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
