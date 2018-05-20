class CreateCandles < ActiveRecord::Migration[5.0]
  def change
    create_table :candles do |t|
      t.integer :result, default: 0
      t.references :symbol_category, foreign_key: true
      t.timestamp :time

      t.timestamps
    end
  end
end
