class GetSpotifyData
  def initialize(spotify_user, user)
    @spotify_user = spotify_user
    @user = user
  end

  def call
    @top_genre = TopGenre.create!(user_id: @user.id)
    @top_artist = TopArtist.create!(user_id: @user.id)
    create_data
  end

  private

  def create_data
    @spotify_user.top_artists.each do |artist|
      Artist.create!(top_artist_id: @top_artist.id, name: artist.name)
      artist.genres.each do |genre|
        Genre.create!(top_genre_id: @top_genre.id, name: genre)
      end
    end
  end
end