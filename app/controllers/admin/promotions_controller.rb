#encoding: utf-8
class Admin::PromotionsController < Admin::AdminController
  load_and_authorize_resource

  def show
    return redirect_to [:admin, @promotion, :users]
  end

  def new
  end

  def create
    flash[:success] = "Promotion créée avec succèss" if @promotion.save
    respond_with @promotion, location: [:admin, @promotion]
  end
end
