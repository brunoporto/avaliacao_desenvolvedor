class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.references :buyer, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true
      t.string :description
      t.decimal :price, precision: 10, scale: 2, default: 0.0
      t.integer :quantity, default: 0
      t.string :address

      t.timestamps null: false
    end
  end
end
