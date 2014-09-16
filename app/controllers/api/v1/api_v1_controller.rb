class Api::V1::ApiV1Controller < ActionController::Base
  before_action :set_response_format

  def authenticate_application!
    @application = Doorkeeper::Application.authenticate(params[:client_id], params[:client_secret])
    raise 'Unauthorized' unless @application.present?
  end

  def current_application
    @application
  end

  def current_ability
    @_current_ability ||= Api::V1::Ability.new(current_application)
  end

  protected
  def set_response_format
    request.format = :json
  end
end
