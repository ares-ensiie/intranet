class Api::V1::Courses::MattersController < Api::V1::ApiV1Controller
  prepend_before_filter :authenticate_application!
  load_and_authorize_resource class: Courses::Matter

  def index
    @matters = Courses::Matter.all
  end

  def show
  end
end
