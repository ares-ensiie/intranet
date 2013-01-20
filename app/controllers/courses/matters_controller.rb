module Courses
  class MattersController < ApplicationController
    def index
      @year = params[:year_id]
      @courses = Courses::Matter.where year: @year
    end
  end
end
