class CreateGroup
  def initialize; end

  def call
    @users = User.where(in_group: false).to_a
    @answers_width = Question.all.pluck(:weight).to_a
    @groups = sort_all_groups
    if put_users_in_chatroom(@groups)
      ap "HELLO"
    end
  end

  private

  def put_users_in_chatroom(groups)
    return if groups.empty?

    chatroom = Chatroom.create!(name: "Groupe d'amis")
    groups.each do |user|
      user.update(chatroom: chatroom)
    end
    true
  end

  def interpersonal_check(two_user_group)
    score = 0
    two_user_group[0].answers.each_with_index do |response, index|
      score += @answers_width[index] if two_user_group[1].answers[index] == response
    end
    score / @answers_width.sum
  end

  def transform_group_in_rating(two_users_groups, users_group)
    if two_users_groups == 10 && (two_users_groups.sum / two_users_groups.count) > 0.7 && check_alone_gender(users_group)
      groups << { rating: (two_users_groups.sum / two_users_groups.count), group: users_group }
    end
  end

  def check_all_group
    groups = []
    @users.combination(5).each do |users_group|
      two_user_groups = []
      users_group.combination(2).each do |two_user_group|
        interpersonal_score = interpersonal_check(two_user_group)
        break if interpersonal_score < 0.5

        two_user_groups << interpersonal_score
      end
      transform_group_in_rating(groups, users_group)
    end
    groups
  end

  def sort_all_groups
    groups = check_all_group
    groups.sort_by(&:rating) unless groups.empty?
    groups
  end

  def check_alone_gender(groups)
    homme = 0
    femme = 0
    groups.each do |user|
      if user.gender == 'Homme'
        homme += 1
      else
        femme += 1
      end
    end
    return false unless homme == 1 || femme == 1

    true
  end

end
