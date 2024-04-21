# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      puts "configure_permitted_parameters"
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, addresses_attributes: [:address_type, :address_1, :address_2, :suite, :city, :state_id, :zipcode]) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, addresses_attributes: [:address_type, :address_1, :address_2, :suite, :city, :state_id, :zipcode]) }
    end
end
