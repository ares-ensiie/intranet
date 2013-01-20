class Courses::YearController < ApplicationController
  def index
    binding.pry
  end

  def show
    @courses = Courses::Matter.where(year: params[:year_id)
    binding.pry
  end 
end
