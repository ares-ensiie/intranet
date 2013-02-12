class Courses::DocumentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Courses::Document

  def index
    @matter = Courses::Matter.where(name: params[:matter_id]).first
    @documents = Courses::Document.where matter: @matter 
    respond_with(:matter, @documents)
  end

  def destroy 
    matter = @document.matter
    @document.destroy 
    respond_with @document, location: courses_matter_documents_path(matter.name)
  end

  def init_form
    if params.has_key? :matter_id then
      matter = Courses::Matter.where name: params[:matter_id]
      if matter.count == 1 then
        @matter_name = matter.first.name
        @matter_year = matter.first.year.to_s
      end
    else
      @matter_name = ""
      @matter_year = ""
    end
    @matters = Courses::Matter.all.map do |m| [m.name, m.year] end 
  end

  def new 
    init_form
  end

  def create
    if params[:courses_document].has_key? "matter" then 
      matter_name = params[:courses_document][:matter]
      req = Courses::Matter.where(name: matter_name)
      if req.count == 0 then
        @matter = Courses::Matter.create name: matter_name, year: params[:document_matter_year]
      else
        @matter = req.first 
      end 
    end

    @document.author = current_user
    @document.matter = @matter
    @document.release_date = DateTime.now
    @document.save

    init_form
    if @document.matter.errors.any? then
      respond_with @document.matter 
    else 
      respond_with @document, location: courses_matter_documents_path(@document.matter.name)
    end
  end
end
