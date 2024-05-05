# frozen_string_literal: true

json.extract! address, :id, :address_type, :address1, :address2, :suite, :city, :state_id, :zipcode, :addressable_id, :addressable_type, :created_at, :updated_at
json.url address_url(address, format: :json)
