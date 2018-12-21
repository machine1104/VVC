class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new]
  before_action :correct_user, only: :destroy

  def new
    @announcement = current_user.announcements.build
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      flash[:success] = 'Annuncio creato!'
      redirect_to user_miei_annunci_path
    else
      render :new
    end
  end

  def destroy
    @announcement.destroy
    flash[:success] = 'Annuncio eliminato correttamente'
    redirect_to request.referrer || root_url
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      flash[:success] = 'Annuncio modificato con successo'
      redirect_to @announcement
    else
      render 'edit'
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def index
    @announcements = Announcement.where(user_id: current_user.id).paginate(page: params[:page], per_page: 15)
  end

  private

  def announcement_params
    params.require(:announcement).permit(:titolo, :categoria, :descrizione, :posizione, :email, :telefono,
                                         :prezzo, :immagine_1, :immagine_2, :immagine_3, :immagine_4,
                                         :immagine_5)
  end

  def correct_user
    @announcement = current_user.announcements.find_by(id: params[:id])
    redirect_to root_path if @announcement.nil?
  end
end
