# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :state
  belongs_to :addressable, polymorphic: true

  validates :address_type, presence: true

  enum address_type: [:mailing, :billing, :shipping, :physical, :restaurant]

  # Scope for filtering addresses by state
  scope :in_state, ->(state) { where(state:) }

  # Scope for filtering addresses by address type
  scope :by_type, ->(type) { where(address_type:) }
end
