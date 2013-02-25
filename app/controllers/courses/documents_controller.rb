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
    if params[:matter_id].present?
      @document.matter = Courses::Matter.find params["matter_id"]
    end
    init_form
  end

  def create
    if params[:courses_document][:matter_id].present? then 
      matter_name = params[:courses_document][:matter_id]
      @matter = Courses::Matter.find_or_create_by name: matter_name, year: params[:document_matter_year]
    end

    @document.author = current_user
    @document.matter = @matter
    @document.release_date = DateTime.now
    @document.save

    params.delete(:matter_id)
    init_form
    @url = new_courses_document_path
    if @document.matter.errors.any? then
      respond_with @document.matter 
    else 
      respond_with @document, location: courses_matter_documents_path(@matter)
    end
  end

  def edit
    init_form
  end

  def update
    matter_name = params[:courses_document][:matter_id]
    params[:courses_document].delete(:matter_id)
    matter = Courses::Matter.find_or_create_by name: matter_name, year: params[:document_matter_year]
    @document.matter = matter
    @document.update_attributes(params[:courses_document])
    respond_with @document, location: courses_matter_documents_path(matter)
  end

  protected

  def init_form
    if params.has_key? :matter_id then
      matter = Courses::Matter.find params[:matter_id]
    end
    @matters = Courses::Matter.all.map do |m| [m.name, m.year] end 
  end
end
