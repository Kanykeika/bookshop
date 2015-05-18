class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :products_hash
      t.text :comment_for_operator

      t.timestamps null: false
    end
  end
end
