class ApplicationController < ActionController::Base
  # deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?
  # # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にストロングパラメータを追加
    # devise_parameter_sanitizer.permit(:account_update, keys: [])
  end
end
