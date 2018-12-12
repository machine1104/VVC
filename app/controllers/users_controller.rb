class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def show
    @user = User.find(params[:id])
  end

end
