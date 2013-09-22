class Developers::Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  skip_before_filter :set_application
  before_filter :authenticate_user!
  authorize_resource class: '::Oauth::Application', though: :current_user, through_association: :oauth_applications

  layout 'developers'

  def new
  end

  def index
    @applications = Oauth::Application.where(owner: current_user)
  end

  def show
    @application = Oauth::Application.find(params[:id])
  end

  def create
    @application = ::Oauth::Application.new params[:application]
    @application.owner = current_user
    @application.save
    respond_with :oauth, @application
  end

  def destroy
    @application = Oauth::Application.find(params[:id])
    @application.destroy
    respond_with @application, location: [:developers, :root]
  end
end
