# frozen_string_literal: true

class Restaurant < ApplicationRecord
  before_save :update_slug

  belongs_to :state

  has_one :restaurant_setting, dependent: :destroy
  has_many :addresses, as: :addressable
  has_many :phones, as: :phonable

  validates :name, presence: true
  validates :city, presence: :true
  validates :state_id, presence: :true

  validates :slug, uniqueness: true

  def update_slug
    slug_array = [self.name, location_name, city, State.find_by(id: self.state_id)&.code]
    self.slug = clean_slug(slug_array).join(" ").squish.parameterize
  end

  def clean_slug(components)
    non_word_characters = "!@#$%^&*()_+={[}]|;:'<,>.?/~`\"\\"
    components.map { |component| component&.delete(non_word_characters)&.squish }
  end

  def to_param
    slug
  end
end
