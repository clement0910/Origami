class QuestionsController < ApplicationController
  def index
    @themes = Theme.all
  end

  private

  def params_questions
    params.require(:questions).permit(:name, :id)
  end
end
