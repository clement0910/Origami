class AnswersController < ApplicationController

  def create_from_swiper
    Answer.create!(question_id: params["question_id"].to_i, response: params["answer"], user: current_user)
    if current_user.answers.count == Question.count
      current_user.update(:all_answered => true)
      CreateGroup.new.call
    end
  end
end
