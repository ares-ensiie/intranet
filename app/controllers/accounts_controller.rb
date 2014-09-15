#encoding: utf-8
class AccountsController < ApplicationController
  prepend_before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.avatar_file_name != nil and params[:user].has_key? :delete_avatar and params[:user][:delete_avatar]  then
      @user.avatar.clear
    end
    @user.update_attributes(resource_params)
    respond_with @user, location: edit_account_path
  end

  def update_password
    @user = current_user
    if @user.update_with_password(params[:user])
      sign_in @user, :bypass => true
      flash[:success] = "Mot de passe mis à jour."
    end
    respond_with @user, location: edit_account_path
  end

  protected
  def resource_params
    params.require(:user).permit(:gender, :avatar)
  end
end
