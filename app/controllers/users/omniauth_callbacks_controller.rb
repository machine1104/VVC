# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if !@user.nil?
      if @user.persisted?
        sign_in @user, :event => :authentication 
        set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      end
      redirect_to new_user_registration_url
    end
    flash[:danger] = "Esiste già un account con questa email"
    redirect_to new_user_registration_url
  end

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if !@user.nil?
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication 
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
    flash[:danger] = "Esiste già un account con questa email"
    redirect_to new_user_registration_url
  end

end
