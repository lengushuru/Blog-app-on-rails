class RenameTextColumnInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :Text, :text
  end
end
