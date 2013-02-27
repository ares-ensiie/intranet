class Trombi::UsersController < Trombi::TrombiController
  prepend_before_filter :authenticate_user!

  def show
    @user = User.find params[:id]
  end
end
