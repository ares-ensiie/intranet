module Courses
  class MattersController < ApplicationController
    before_filter :authenticate_user!

    def index
      @year = params[:year_id]
      @courses = Courses::Matter.where year: @year
    end
  end
end
