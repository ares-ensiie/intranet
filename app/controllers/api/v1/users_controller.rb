class Api::V1::UsersController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource

  def show
  end
end
