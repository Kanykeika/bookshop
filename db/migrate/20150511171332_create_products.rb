class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :year
      t.string :author
      t.integer :papers_count
      t.string :format
      t.text :description
      t.string :image_url

      t.timestamps null: false
    end


  end
end
