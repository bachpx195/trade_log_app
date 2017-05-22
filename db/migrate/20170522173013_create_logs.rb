class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :name
      t.string :adress
      t.float :money
      t.datetime :datetime
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
