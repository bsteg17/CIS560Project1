class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.integer :id

      t.timestamps
    end
  end
end
