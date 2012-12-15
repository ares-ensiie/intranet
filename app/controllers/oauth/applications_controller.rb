class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  before_filter :authenticate_user!

  def index
    @applications = current_user.oauth_applications
  end

  def create
    @application = Doorkeeper::Application.new(params[:application])
    @application.owner = current_user
    @application.save
    respond_with :oauth, @application
  end
end
