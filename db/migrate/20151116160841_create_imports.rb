class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :buyer
      t.string :description
      t.decimal :price
      t.string :quantity
      t.string :address
      t.string :supplier

      t.timestamps null: false
    end
  end
end
