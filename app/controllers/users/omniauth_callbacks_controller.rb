# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = ::SetUserLoginProviderService.call(auth)
    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to unauthenticated_root_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    unauthenticated_root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || authenticated_root_path
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
