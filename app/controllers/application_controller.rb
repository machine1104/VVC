class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters; end
end
