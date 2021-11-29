class QuestionsController < ApplicationController
  def index
    @themes = Theme.all
    @answers = current_user.answers.count
    @questions = Question.all
  end

  private

  def params_questions
    params.require(:questions).permit(:name, :id)
  end
end
