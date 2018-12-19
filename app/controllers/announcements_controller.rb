class AnnouncementsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy, :edit, :new]

    def new
    end

    def create
        @announcement = current_user.announcements.build(announcement_params)
        if @announcement.save
            flash[:success] = "Annuncio creato!"
            redirect_to announcements_path
        else
            render 'static_pages/home'
        end
    end

    def destroy
    end

    def edit
    end

    def show
    end

    def index
        @announcements = Announcement.where(user_id: current_user.id).paginate(page: params[:page], per_page: 15)
    end

    private

    def announcement_params
        params.require(:announcement).permit(:titolo, :categoria, :descrizione, :posizione, :email, :telefono,
                       :prezzo, :immagine)
    end
end
