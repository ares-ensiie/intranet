class Developers::Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  before_filter :authenticate_user!
  load_and_authorize_resource class: '::Oauth::Application', though: :current_user, through_association: :oauth_applications

  layout 'developers'

  def new
  end

  def show
  end

  def create
    @application = ::Oauth::Application.new params[:application]
    @application.owner = current_user
    @application.save
    respond_with :oauth, @application
  end

  def destroy
    @application.destroy
    respond_with @application, location: [:developers, :root]
  end
end
