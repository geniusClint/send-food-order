# frozen_string_literal: true

json.extract! restaurant, :id, :name, :location_name, :city, :state
json.url restaurant_url(restaurant, format: :json)
