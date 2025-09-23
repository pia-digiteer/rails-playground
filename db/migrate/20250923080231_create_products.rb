class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :qty
      t.text :desc
      t.string :image_url

      t.timestamps
    end
  end
end
