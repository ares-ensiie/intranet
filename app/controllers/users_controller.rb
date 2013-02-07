# encoding utf-8
class UsersController < ApplicationController
  prepend_before_filter :authenticate_user!

  def show
    @user = User.find params[:id]
  end
end
