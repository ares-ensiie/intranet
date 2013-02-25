class Courses::DocumentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Courses::Document


  def index
    @matter = Courses::Matter.find params[:matter_id].downcase
    @documents = Courses::Document.where matter: @matter 
    @user_is_document_owner = current_user.is_document_owner?
    respond_with(:matter, @documents)
  end

  def destroy 
    matter = @document.matter
    @document.destroy 
    respond_with @document, location: courses_matter_documents_path(matter)
  end

  def new 
    @url = courses_matters_path
    init_form
  end

  def create
    if params[:courses_document].has_key? "matter" then 
      matter_name = params[:courses_document][:matter]
      @matter = Courses::Matter.find_or_create_by name: matter_name, year: params[:document_matter_year]
    end

    @document.author = current_user
    @document.matter = @matter
    @document.release_date = DateTime.now
    @document.save

    params.delete(:matter_id)
    init_form
    if @document.matter.errors.any? then
      respond_with @document.matter 
    else 
      respond_with @document, location: courses_matter_documents_path(@matter)
    end
  end

  def edit
    @url = courses_matter_document_path(:matter, @document)
    init_form
  end

  def update
    matter_name = params[:courses_document][:matter]
    params[:courses_document].delete(:matter)
    matter = Courses::Matter.find_or_create_by name: matter_name, year: params[:document_matter_year]
    @document.matter = matter
    @document.update_attributes(params[:courses_document])
    respond_with @document, location: courses_matter_documents_path(matter)
  end

  protected

  def init_form
    if params.has_key? :matter_id then
      matter = Courses::Matter.find params[:matter_id].downcase
      if matter != nil then
        @matter_name = matter.name
        @matter_year = matter.year.to_s
      end
    else
      @matter_name = ""
      @matter_year = ""
    end
    @matters = Courses::Matter.all.map do |m| [m.name, m.year] end 
  end
end
