class RemoveCategoryIdFromSubcategories < ActiveRecord::Migration
  def change
    remove_column :subcategories, :category_id, :string
  end
end
