class Abroad::ReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource class: Abroad::Report

  def index
    @reports = Abroad::Report.all
  end

  def new
    @report = Abroad::Report.new
  end

  def create
    @report = Abroad::Report.new create_params
    @report.owner = current_user
    if @report.save
      respond_with @report, location: abroad_root_path
    else
      respond_with @report
    end
  end

  def update
    @report.update_attributes create_params
    respond_with @report
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

  def destroy
    @report.destroy
    respond_with @report
  end

  private

  def create_params
    params.require(:abroad_report).permit(:country, :location, :type, :content, :begin_date, :end_date)
  end
end
