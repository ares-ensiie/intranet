class Courses::YearController < ApplicationController
  before_filter :authenticate_user!

  def index
    @courses = {}
    %w(1A 2A 3A).each do |a|
      @courses[a] = (Courses::Matter.where year: a).to_a
    end
  end
end

