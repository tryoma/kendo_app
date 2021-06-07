class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def current_user?(user)
    user == current_user
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    flash[:notice] = "ログインに成功しました"
    root_path
  end

  def after_sign_out_path_for(_resource)
    flash[:alert] = "ログアウトしました"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  end
end
