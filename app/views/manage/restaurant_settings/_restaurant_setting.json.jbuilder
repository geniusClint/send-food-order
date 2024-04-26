# frozen_string_literal: true

json.extract! restaurant_setting, :id, :tax_rate, :website, :reporting_code, :order_cutoff_minutes, :notify_email, :notification_email, :timezone, :day_start_time, :restaurant_id, :created_at, :updated_at
json.url restaurant_setting_url(restaurant_setting, format: :json)
