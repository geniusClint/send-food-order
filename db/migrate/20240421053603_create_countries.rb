# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries, id: :uuid do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
