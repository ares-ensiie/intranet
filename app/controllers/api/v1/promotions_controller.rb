class Api::V1::PromotionsController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource

  def index
  end

  def show
  end
end
