module Courses
  class MattersController < ApplicationController
    def index
      @promo = params[:promo_id]
      documents = Document.only(:course_label).where(promo: @promo)
      @courses = []
      documents.each do |d|
        @courses << d.course_label
      end
    end
  end
end
