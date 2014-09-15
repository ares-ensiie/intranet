class Oauth::AuthorizedApplicationsController < Doorkeeper::AuthorizedApplicationsController
  layout 'application'

  def destroy
    # By default params[:id] is the slug, we need the real id
    app = Oauth::Application.find params[:id]
    Doorkeeper::AccessToken.revoke_all_for app.id, current_resource_owner
    redirect_to oauth_authorized_applications_url, :notice => I18n.t(:notice, :scope => [:doorkeeper, :flash, :authorized_applications, :destroy])
  end
end
