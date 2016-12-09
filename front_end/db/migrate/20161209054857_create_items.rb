class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,
      t.integer :amount_healed,
      t.integer :cp_increase,
      t.decimal :catch_rate

      t.timestamps
    end
  end
end