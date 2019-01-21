class AnnouncementsController < ApplicationController
  include AnnouncementsHelper

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
    categoria = params[:categoria]
    search = params[:search]
    regione = params[:regione]
    if categoria.nil? && regione.nil?
      if !search.empty?
        @announcements = Announcement.none
        search.split.each do |s|
          res = Announcement.where('titolo LIKE ? OR descrizione LIKE ?', "%#{s}%", "%#{s}%")
          @announcements = @announcements.or(res)
        end
      else
        @announcements = Announcement.all
      end
    elsif regione.nil?
      @announcements = Announcement.where('categoria LIKE ?', "%#{categoria}%")
    else
      @announcements = Announcement.where('regione LIKE ?', "%#{regione}%")
    end
    @announcements = @announcements.paginate(page: params[:page], per_page: 15)
  end

  def my_announcement_index
    @announcements = Announcement.where(user_id: current_user.id).paginate(page: params[:page], per_page: 15)
  end

  def filter
    prezzo = if params[:prezzo] == 'Crescente'
               'ASC'
             else
               'DESC'
             end
    regione = params[:regione]
    categoria = params[:categoria]
    @announcements = Announcement.filter(prezzo, regione, categoria)
    @announcements = @announcements.paginate(page: params[:page], per_page: 15)
  end

  def nearby
    place = params[:place]
    range = params[:range]
    puts '+++++++++++++++++++'
    puts place.empty?
    if !place.empty?
      curr_pos = Geocoder.search(place).first.coordinates
      @announcements = Announcement.select { |ann| Geocoder::Calculations.distance_between(get_coordinates(ann.posizione), curr_pos) <= range }
      @announcements = @announcements.paginate(page: params[:page], per_page: 15)
    else
      @announcements = Announcement.all
      @announcements = @announcements.paginate(page: params[:page], per_page: 15)
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:titolo, :categoria, :descrizione, :posizione, :email, :telefono,
                                         :prezzo, :immagine_1, :immagine_2, :immagine_3, :immagine_4,
                                         :immagine_5, :search, :regione)
  end

  def correct_user
    @announcement = current_user.announcements.find_by(id: params[:id])
    redirect_to root_path if @announcement.nil?
  end
end
