# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :permitted_parameters, if: :devise_controller?

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[firstname lastname phoneno city email passowrd])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[firstname lastname phoneno city email passowrd current_password])
  end
end
