# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    create_table :phones, id: :uuid do |t|
      t.integer :phone_type
      t.string :country_code
      t.string :number
      t.string :phone_contirmation_token
      t.datetime :phone_confirmation_token_expiration
      t.boolean :phone_confirmed
      t.references :phonable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
