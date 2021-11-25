class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create_from_swiper
    Answer.create(question_id: params["question_id"].to_i, response: params["answer"], user: current_user)

    render json: { answer: "ok" }
  end
end
