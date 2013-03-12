class Api::V1::UsersController < Api::V1::ApiV1Controller
  before_filter :authenticate_application!, except: :self
  load_and_authorize_resource except: :self
  doorkeeper_for :self

  def show
  end

  def self
    @user = current_resource_owner
  end

  def search
    promotions_param = params[:promotions] || params[:promotion]
    params[:promotions] = promotions_param.try :split, ','
    params[:q] = '*' if params[:promotions].try(:any?) and params[:q].blank?
    search = User.search(params.permit(:q, :promotions => []).symbolize_keys)
    @users = search.results
  end

  protected
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id)
  end
end
