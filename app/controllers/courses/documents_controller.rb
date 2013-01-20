module Courses
  class DocumentsController < ApplicationController
    def index
      @year = params[:year_id]
      @matter = Courses::Matter.where name: params[:matter_id]
      @documents = Courses::Document.where matter: @matter.first
    end

    def create 
    end
  end
end
