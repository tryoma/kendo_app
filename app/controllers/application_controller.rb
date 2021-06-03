class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def current_user?(user)
    user == current_user
  end

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後のリダイレクト先をマイページへ
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました" 
    root_path  
  end

  # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました"
    root_path
  end

  protected
  
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  end
end
