# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "no_header"

  protected
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
end
