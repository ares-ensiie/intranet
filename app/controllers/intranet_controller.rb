class IntranetController < ApplicationController
  def index
    @ragots = Ragot.limit(5)
  end
end
