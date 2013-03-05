class Developers::DevelopersController < ApplicationController
  prepend_before_filter :authenticate_user!
  layout 'developers'
end
