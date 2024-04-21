# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.integer :address_type
      t.string :address1
      t.string :address2
      t.string :suite
      t.string :city
      t.references :state, null: false, foreign_key: true, type: :uuid
      t.string :zipcode
      t.references :addressable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
