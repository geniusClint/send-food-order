# frozen_string_literal: true

class State < ApplicationRecord
  belongs_to :country

  accepts_nested_attributes_for :country

  has_many :addresses, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { scope: :country_id }
  validates :country_id, presence: true
end
