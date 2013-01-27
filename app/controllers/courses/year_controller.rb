class Courses::YearController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @courses = Courses::Matter.where(year: params[:year_id])
  end 
end
