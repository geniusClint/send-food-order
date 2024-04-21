# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :states, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
