class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    do_auth "facebook"
  end

  def google_oauth2
    do_auth "google"
  end

  private
  def do_auth(auth)
    @user = User.find_or_create_from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = t("devise.omniauth_callbacks.success", kind: auth.titleize) if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:alert] = t("devise.omniauth_callbacks.failure", kind: auth, reason: "unknown") if is_navigational_format?
      session["devise.#{auth}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
