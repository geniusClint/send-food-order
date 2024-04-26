# frozen_string_literal: true

class CreateRestaurantSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_settings, id: :uuid do |t|
      t.decimal :tax_rate
      t.string :website
      t.string :reporting_code
      t.integer :order_cutoff_minutes
      t.boolean :notify_email
      t.text :notification_email
      t.string :timezone
      t.time :day_start_time
      t.belongs_to :restaurant, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
