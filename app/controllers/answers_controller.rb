class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    announcement_id = params[:announcement_id]
    user_id = params[:user_id]
    contenuto = params[:answer][:contenuto]
    question_id = params[:question_id]
    @answer = Answer.new(contenuto: contenuto, user_id: user_id, announcement_id: announcement_id, question_id: question_id)
    if @answer.save
      flash[:success] = 'Domanda creata correttamente!'
    else
      flash[:danger] = 'Errore!'
    end
    redirect_to user_announcement_path(user_id, announcement_id)
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:contenuto, :user_id, :announcement_id, :question_id)
  end

end
