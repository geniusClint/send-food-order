# frozen_string_literal: true

class AddCityAndStateToRestaurant < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :city, :string
    add_reference :restaurants, :state, foreign_key: true, type: :uuid
  end
end
