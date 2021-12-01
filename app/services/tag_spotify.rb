class TagSpotify
  def initialize(groups)
    @groups = groups.reject { |group| group[:bot] == true }
    @artists = Artist.all.pluck(:name)
  end

  def call
    return false unless check_all_connect

    tag_artists = common_artists
    { artists: tag_artists }
  end

  def check_all_connect
    @groups.each { |user| return false unless user.connect_spotify? }
    true
  end

  # def common_genres
  #   @groups.each do |user|
  #     user.genres
  #   end
  # end
  #
  def common_artists
    array = []
    @artists.each do |artist|
      bool = true
      @groups.each { |user| bool = false unless user.artists.pluck(:name).to_a.include? artist }
      array << artist if bool == true
    end
    array.first(5)
  end
end
