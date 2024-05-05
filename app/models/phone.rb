# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :phonable, polymorphic: true
end
