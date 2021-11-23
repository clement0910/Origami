class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  end

  def profile
    @user = current_user
  end

  def update
    #stimulus js ?
    @user = User.friendly.find(params[:id])
    @user.update(params_user)
    redirect_to profile_path
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @recommendations = RSpotify::Recommendations.generate(seed_genres: ['hip-hop', 'french'])
  end

  private
  def params_user
    params.require(:user).permit(:job, :photo)
  end
end
