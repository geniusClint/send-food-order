# frozen_string_literal: true

module CountriesHelper
  def countries_for_select
    Country.order(:name).map { |c| [c.name, c.id] }
  end
end
