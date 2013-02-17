class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  respond_to :html, :json
  prepend_before_filter :protect_application! if Rails.env.staging?

  protected
  def protect_application!
    return true unless ENV['PROTECTION_PASSWORD']
    authenticate_or_request_with_http_basic do |username, password|
      password == ENV['PROTECTION_PASSWORD']
    end
  end
end
