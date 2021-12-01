class CreateGroup
  def initialize; end

  def call
    @users = User.where(in_group: false).to_a
    @answers_width = Question.all.pluck(:weight).to_a
    @groups = sort_all_groups
    put_users_in_chatroom(@groups)
  end

  private

  def put_users_in_chatroom(groups)
    return if groups.empty?

    group = groups[0]
    chatroom = Chatroom.create!(name: "Groupe d'amis", rating: group[:rating])
    group[:group].each do |user|
      user.update(chatroom_id: chatroom.id)
      user.update(in_group: true)
    end
    InitializeChatroom.new(group[:group]).call
  end

  def interpersonal_check(two_user_group)
    score = 0
    two_user_group[0].answers.each_with_index do |answer, index|
      score += @answers_width[index] if two_user_group[1].answers[index].response == answer.response
    end
    score / @answers_width.sum
  end

  def transform_group_in_rating(two_users_groups, users_group, groups)
    # don't forget homme/femme
    if two_users_groups.count == 10 && (two_users_groups.sum / two_users_groups.count) > 0.7
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
      transform_group_in_rating(two_user_groups, users_group, groups)
    end
    groups
  end

  def sort_all_groups
    groups = check_all_group
    groups.sort { |k1, k2|  k1[:rating] <=> k2[:rating] } unless groups.empty?
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
