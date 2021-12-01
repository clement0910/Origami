class CommonInterest
  def initialize(groups)
    @groups = groups
  end

  def call
    questions_id = get_questions_theme
    check_common_interest(questions_id)
  end

  private

  def get_questions_theme
    questions_id = []
    questions = Theme.find_by_name("Questions Bot").questions
    questions.each do |question|
      questions_id << question.id
    end
    questions_id
  end

  def check_common_interest(questions_id)
    common_answers = []
    questions_id.each do |question_id|
      tab = []
      @groups.each do |user|
        tab << user.answers.find_by(question_id: question_id).response
      end
      common_answers << Question.find(question_id) if tab.uniq.size == 1
    end
    common_answers
  end

end
