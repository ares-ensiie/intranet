class Api::V1::Courses::DocumentsController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource class: Courses::Document

  def index
    matter = Courses::Matter.find params[:matter_id].downcase
    @documents = Courses::Document.where matter: matter
  end

  def show
  end
end

