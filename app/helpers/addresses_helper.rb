# frozen_string_literal: true

module AddressesHelper
  def addresstypes_for_select
    Address.address_types.map { |key, value| [key.titleize, Address.address_types.key(value)] }
  end

  def states_for_select
    State.order(:name).map { |s| [s.name, s.id] }
  end
end
