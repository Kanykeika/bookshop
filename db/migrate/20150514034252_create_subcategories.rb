class CreateSubcategories < ActiveRecord::Migration
  def change
    create_alter_table :subcategories do |t|
      t.string :name


      t.timestamps null: false
    end
  end
end
