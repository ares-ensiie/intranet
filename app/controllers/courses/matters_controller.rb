class Courses::MattersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Courses::Matter

  def index
    @courses = {}
    %w(1A 2A 3A).each do |a|
      @courses[a] = (Courses::Matter.where year: a).to_a
    end
  end

  def destroy
    @matter = Courses::Matter.find params[:id]
    @matter.destroy
    respond_with @matter, location: courses_matters_path
  end
end
