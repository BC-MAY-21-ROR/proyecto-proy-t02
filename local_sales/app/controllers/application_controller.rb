class ApplicationController < ActionController::Base
  load_and_authorize_resource unless: :devise_controller?
  include Pagy::Backend

  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def access_denied
    redirect_to root_path
  end
end
