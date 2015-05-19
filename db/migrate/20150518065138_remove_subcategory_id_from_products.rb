class RemoveSubcategoryIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :subcategory_id, :string
  end
end
