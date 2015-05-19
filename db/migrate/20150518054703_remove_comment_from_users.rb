class RemoveCommentFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :comment, :string
    remove_column :users, :string, :string
  end
end
