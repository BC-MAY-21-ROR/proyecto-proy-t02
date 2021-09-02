class ApplicationController < ActionController::Base
  load_and_authorize_resource unless: :devise_controller?
  include Pagy::Backend

  rescue_from CanCan::AccessDenied, with: :access_denied

  def after_sign_in_path_for(resource)
    if resource.super_admin?
      administrators_path
    elsif resource.admin?
      products_path
    end
  end

  private

  def access_denied
    return redirect_to products_path if current_user.admin?
  end
end
