class GetSpotifyData
  def initialize(spotify_user, user)
    @spotify_user = spotify_user
    @user = user
  end

  def call
    # remove_data if @user.connect_spotify?
    #
    # @top_genre = TopGenre.create!(user_id: @user.id)
    # @top_artist = TopArtist.create!(user_id: @user.id)
    create_data
    @user.update(connect_spotify: true)
  end

#   private
#
#   def remove_data
#     @user.top_artist.artists.destroy_all
#     @user.top_artist.destroy
#     @user.top_genre.genres.destroy_all
#     @user.top_genre.destroy
#   end
#
  def create_data
    @spotify_user.top_artists.each do |artist_spotify|
      artist = Artist.find_or_create_by!(name: artist_spotify.name)
      UserArtist.create!(artist: artist, user: @user)
      artist_spotify.genres.each do |genre_spotify|
        genre = Genre.find_or_create_by!(name: genre_spotify)
        ArtistGenre.create!(genre: genre, artist: artist)
      end
    end
  end

end