class RagotsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ragots = Ragot.all
  end 

  def create
    ragot = Ragot.new(params)
    ragot.date = DateTime.now
    ragot.author = current_user
    ragot.save!

    respond_to do |format|
      format.html {
        redirect_to "/ragots"
      }
      format.json {
        render :json => ragot.to_json
      }
    end
  end
end
