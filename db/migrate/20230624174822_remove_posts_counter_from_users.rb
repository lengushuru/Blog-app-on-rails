class RemovePostsCounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :PostCounter, :integer
  end
end
