# frozen_string_literal: true

class State < ApplicationRecord
  belongs_to :country

  accepts_nested_attributes_for :country

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { scope: :country_id }
  validates :country_id, presence: true
end
