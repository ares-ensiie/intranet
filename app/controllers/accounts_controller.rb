#encoding: utf-8
class AccountsController < ApplicationController
  prepend_before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
  end

  def update_password
    @user = current_user
    if @user.update_with_password(params[:user])
      sign_in @user, :bypass => true
      flash[:success] = "Mot de passe mis à jour."
    end
    respond_with @user, location: edit_account_path
  end
end
