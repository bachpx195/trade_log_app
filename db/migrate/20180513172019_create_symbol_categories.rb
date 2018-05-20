class CreateSymbolCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :symbol_categories do |t|
      t.string :name
      t.references :broker, foreign_key: true

      t.timestamps
    end
  end
end
