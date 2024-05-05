# frozen_string_literal: true

json.extract! phone, :id, :phone_type, :country_code, :number, :phone_contirmation_token, :phone_confirmation_token_expiration, :phone_confirmed, :phonable_id, :phonable_type, :created_at, :updated_at
json.url phone_url(phone, format: :json)
