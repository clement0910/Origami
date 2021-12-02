class TagSpotify
  def initialize(groups)
    @groups = groups.reject { |group| group[:bot] == true }
    @artists = Artist.all.pluck(:name)
  end

  def call
    return false unless check_all_connect

    common_artists
  end

  def check_all_connect
    @groups.each { |user| return false unless user.connect_spotify? }
    true
  end

  def common_artists
    array = []
    @groups.map { |user| array << user.id }
    result = []
    @artists.each { |artist| result << artist if (array & artist.users.ids).size == 5 }
    result.first(5)
  end
end
