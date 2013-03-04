class Api::V1::UsersController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource

  def show
  end

  def search
    promotions_param = params[:promotions] || params[:promotion]
    params[:promotions] = promotions_param.try :split, ','
    search = User.search(params.permit(:q, :promotions => []).symbolize_keys)
    @users = search.results
  end
end
