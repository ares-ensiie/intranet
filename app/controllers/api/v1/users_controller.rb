class Api::V1::UsersController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource

  def show
  end

  def search
    promotions_param = params[:promotions] || params[:promotion]
    params[:promotions] = promotions_param.try :split, ','
    params[:q] = '*' if params[:promotions].try(:any?) and params[:q].blank?
    search = User.search(params.permit(:q, :promotions => []).symbolize_keys)
    @users = search.results
  end
end
