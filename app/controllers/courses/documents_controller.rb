module Courses
  class DocumentsController < ApplicationController
    def index
      @promo = params[:promo_id]
      @course_label = params[:matter_id]
      @documents = Document.where(
        :promo => params[:promo_id],
        :course_label => params[:matter_id]
      )
    end

    def show 
      @document = Document.find(params[:id])
      send_file Rails.root.to_path + "/public/" + @document.file_path
    end 

    def create 
    end
  end
end
