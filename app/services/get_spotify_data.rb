class GetSpotifyData
  def initialize(spotify_user, user)
    @spotify_user = spotify_user
    @user = user
  end

  def call
    remove_data if @user.connect_spotify?
    create_data
    @user.update(connect_spotify: true)
  end

  private

  def remove_data
    @user.user_artists.destroy_all
  end

  def create_data
    @spotify_user.top_artists.each do |artist_spotify|
      artist = Artist.find_or_create_by!(name: artist_spotify.name)
      UserArtist.create!(artist: artist, user: @user)
      artist_spotify.genres.each do |genre_spotify|
        genre = Genre.find_or_create_by!(name: genre_spotify)
        ArtistGenre.find_or_create_by!(genre: genre, artist: artist)
      end
    end
  end

end