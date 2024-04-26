# frozen_string_literal: true

module AddressesHelper
  def states_for_select
    State.order(:name).map { |s| [s.name, s.id] }
  end
end
