class Admin::UsersController < Admin::AdminController
  load_and_authorize_resource :promotion
  load_and_authorize_resource through: :promotions, shallow: true
  # load_and_authorize_resource

  def index
    @users = @promotion.try(:students) || User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    @user.update_attributes params[:user]
    respond_with :admin, @user
  end

  def create
    @user.save
    # binding.pry_remote
    respond_with @user, location: new_admin_user_path
  end

  def destroy
    @user.destroy
    respond_with @user, location: admin_users_path
  end

  protected
end
