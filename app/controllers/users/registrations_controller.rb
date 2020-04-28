# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if !@current_user
      flash[:notice] = "権限がありません"
      redirect_to("/users/sign_in")
    end

    # super

  end

  # POST /resource
  def create
    super

    if !@current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/sign_in")
    end
    
    # Userが無事につられていたらProfileを作成
    if resource
      profile = Profile.new
      profile.user_id = resource.id
      profile.name = params[:profile][:name]
      profile.save
    end
  end

  # def create
  #   redirect_to '/users/sign_in', notice: 'ユーザの新規作成はできません。'
  # end

  private
  def account_update_params
    params.require(:user).permit(:username, :email, :password)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
