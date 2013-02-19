class Admin::AdminController < ApplicationController
  prepend_before_filter :authenticate_user!
  before_filter :authenticate_admin
  layout 'admin'
  respond_to :html, :json

  protected
  def authenticate_admin
    raise 'Unauthorized' unless current_user.is_admin?
  end
end
