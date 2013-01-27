class Courses::DocumentsController < ApplicationController
  load_and_authorize_resource class: Courses::Document
  before_filter :authenticate_user!, :matter_name_to_id

  def matter_name_to_id 
    @matter = Courses::Matter.where(name: params[:matter_id]).first 
    params[:matter_id] = @matter.id
  end

  def index
    @year = params[:year_id]
    @documents = Courses::Document.where matter: @matter
  end

  def destroy 
    @document.destroy 
    respond_with @document, location: courses_year_matter_documents_path
  end

  def new 
    @year = params[:year_id]
    @document = @matter.documents.new author: current_user
  end

  def create
    @year = params[:year_id]
    @document.author = current_user
    @document.matter = @matter
    @document.release_date = DateTime.now
    @document.save
    respond_with @document, location: courses_year_matter_documents_path
  end
end
