class RenameCommentsCounterColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :CommentsCounter, :comments_counter
  end
end
