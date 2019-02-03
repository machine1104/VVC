class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    announcement_id = params[:announcement_id]
    user_id = params[:user_id]
    contenuto = params[:question][:contenuto]
    @question = Question.new(contenuto: contenuto, user_id: user_id, announcement_id: announcement_id)
    if @question.save
      flash[:success] = 'Domanda creata correttamente!'
    else
      flash[:danger] = 'Errore!'
    end
    redirect_to user_announcement_path(user_id, announcement_id)
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = 'Domanda eliminata correttamente'
    redirect_to request.referrer || root_url
  end

  private

  def question_params
    params.require(:question).permit(:contenuto, :user_id, :announcement_id)
  end
end
