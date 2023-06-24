class RemoveTrueFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :true
  end
end
