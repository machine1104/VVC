class UsersController < ApplicationController

  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utente eliminato"
    redirect_to users_url
  end
  
  def admin_user
    if current_user == nil
      redirect_to(new_user_session_path)
    else
      unless current_user.admin?
        flash[:danger] = "Non sei un amministratore"
        redirect_to(root_url)
      end
    end
  end

end
