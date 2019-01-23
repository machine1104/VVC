class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    announcement_id = params[:announcement_id]
    @contact = Contact.new(contacts_params)
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Segnalazione inviata con successo'
      redirect_to announcement_path(announcement_id)
    else
      flash.now[:error] = 'Impossibile inviare la segnalazione!'
      render :new
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:nome, :email, :messaggio)
  end

end
