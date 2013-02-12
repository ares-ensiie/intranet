# encoding utf-8
class PromotionsController < ApplicationController
  prepend_before_filter :authenticate_user!

  def show
    @promo = Promotion.find params[:id]
    @students = @promo.students.asc :first_name
    @promos = Promotion.all
  end

  def index
    @promo = current_user.promotion
    redirect_to promotion_path(@promo)
  end
end
