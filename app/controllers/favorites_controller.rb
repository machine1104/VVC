class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_announcement!, except: :index

  def create
    current_user.favorite(@announcement)
    @contact = Contact.new
    redirect_to announcements_path
  end

  def destroy
    current_user.unfavorite(@announcement)
    @contact = Contact.new
    redirect_to announcements_path
  end

  def index
    @favorites = Announcement.joins(:favorites).where("favorites.user_id == ?", current_user.id)
    @favorites = @favorites.paginate(page: params[:page], per_page: 15)
  end

  private

  def find_announcement!
    @announcement = Announcement.find_by_id(params[:announcement_id])
  end
end
