class RemoveCartFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cart, :string
  end
end
