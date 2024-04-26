class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants, id: :uuid do |t|
      t.string :name
      t.string :location_name
      t.string :location_code
      t.string :slug

      t.timestamps
    end
  end
end
