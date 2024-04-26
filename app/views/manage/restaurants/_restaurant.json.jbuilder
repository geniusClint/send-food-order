# frozen_string_literal: true

json.extract! restaurant, :id, :name, :location_name, :location_code, :slug, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
