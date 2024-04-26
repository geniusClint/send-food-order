# frozen_string_literal: true

class RemoveLocationCodeFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :location_code, :string
  end
end
