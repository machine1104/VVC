# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:comune, :nome, :indirizzo,
                         :email, :password, :password_confirmation, :cognome, :current_password)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password, :password_confirmation, :nome, :cognome)
    end
  end

  def update_resource(resource, params)
    if !resource.provider.nil?
      resource.update_without_password(params)
    else
      super
    end
  end
end
