class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.float :lat
      t.float :lon
      t.references :category
      t.integer :level
      t.string :comment
      t.string :image_url

      t.timestamps
    end
    add_index :crimes, :category_id
  end
end
