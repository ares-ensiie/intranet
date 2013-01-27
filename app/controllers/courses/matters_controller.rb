class Courses::MattersController < ApplicationController
  load_and_authorize_resource class: Courses::Matter
  before_filter :authenticate_user!


  def index
    @year = params[:year_id]
    @courses = Courses::Matter.where year: @year
  end

  def new 
    @year = params[:year_id]
  end

  def create
    @year = params[:year_id]
    @matter.year = @year
    @matter.save
    if @matter.errors.any? then
      respond_with @matter, location: new_courses_year_matter_path(@year)
    else
      respond_with @matter, location: courses_year_matter_documents_path(@year, @matter.name)
    end
  end

  def destroy
    @matter = Courses::Matter.find params[:id]
    @matter.destroy

    respond_with @matter, location: courses_year_index_path
  end
end
