class Admin::AdminController < ApplicationController
  prepend_before_filter :authenticate_user!
  layout 'admin'
  respond_to :html, :json
end
