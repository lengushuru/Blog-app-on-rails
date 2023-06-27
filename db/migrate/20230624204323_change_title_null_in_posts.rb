class ChangeTitleNullInPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :title, :string, null: false
  end
end
