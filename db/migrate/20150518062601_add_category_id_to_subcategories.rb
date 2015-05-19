class AddCategoryIdToSubcategories < ActiveRecord::Migration
  def change
    add_foreign_key :subcategories, :category_id
  end
end
