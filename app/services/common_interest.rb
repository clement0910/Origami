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
    questions = Question.all
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
      if tab.uniq.size == 1
        common_answers << { question: Question.find(question_id), bool: tab[0] }
      end
    end
    common_answers
  end

end
