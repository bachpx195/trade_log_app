class CreateCookieTools < ActiveRecord::Migration[5.0]
  def change
    create_table :cookie_tools do |t|
      t.text :cookie_str
      t.timestamps
    end
  end
end
