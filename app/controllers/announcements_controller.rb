class AnnouncementsController < ApplicationController
  include AnnouncementsHelper

  before_action :authenticate_user!, only: %i[create destroy edit new]
  before_action :correct_user, only: %i[destroy edit]

  def new
    @announcement = current_user.announcements.build
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      redirect_to user_announcement_path(current_user.id, @announcement.id)
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
    @contact = Contact.new
    @questions = Question.where(announcement_id: @announcement.id)
    @question = Question.new
    @answers = Answer.where(announcement_id: @announcement.id)
    @answer = Answer.new
  end

  def index
    categoria = params[:categoria]
    search = params[:search]
    regione = params[:regione]
    if categoria.nil? && regione.nil? && !search.nil?
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
    @announcements = @announcements.favorited_by(params[:favorited]) if params[:favorited].present?
    @announcements = @announcements.paginate(page: params[:page], per_page: 15)

  end

  def my_announcement_index
    @announcements = Announcement.where(user_id: current_user.id).paginate(page: params[:page], per_page: 15)
  end

  def filter
    place = params[:place]
    range = params[:distance_range]
    if params[:prezzo] == 'Crescente'
      prezzo = 'ASC'
    elsif params[:prezzo] == 'Decrescente'
      prezzo = 'DESC'
    else
      prezzo = ''
    end
    regione = params[:regione]
    categoria = params[:categoria]
    if !place.empty?
      curr_pos = Geocoder.search(place).first.coordinates
      @announcements = Announcement.filter(prezzo, regione, categoria)
      @announcements = @announcements.select { |ann| Geocoder::Calculations.distance_between(get_coordinates(ann.posizione), curr_pos) <= range.to_f }
    else
      @announcements = Announcement.filter(prezzo, regione, categoria)
    end
    @announcements = @announcements.paginate(page: params[:page], per_page: 15)
  end

  def nearby
    place = params[:place]
    range = params[:distance_range]
    if !place.empty?
      curr_pos = Geocoder.search(place).first.coordinates
      @announcements = Announcement.select { |ann| Geocoder::Calculations.distance_between(get_coordinates(ann.posizione), curr_pos) <= range.to_f }
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
    if current_user.admin?
      @announcement = Announcement.find_by(id: params[:id])
    else
      @announcement = current_user.announcements.find_by(id: params[:id])
    end
    if @announcement.nil?
      flash[:danger] = 'Non sei un amministratore'
      redirect_to root_path
    end
  end

  def admin_user
    if current_user.nil?
      redirect_to(new_user_session_path)
    else
      unless current_user.admin?
        flash[:danger] = 'Non sei un amministratore'
        redirect_to(root_url)
      end
    end
  end
end
