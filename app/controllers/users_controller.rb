class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  end

  def profile
    @age = Date.today.year - current_user.birthday.year
    @age -= 1 if Date.today < current_user.birthday + @age.years
  end

  def edit
    @age = Date.today.year - current_user.birthday.year
    @age -= 1 if Date.today < current_user.birthday + @age.years
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(params_user)

    respond_to do |format|
      format.html { redirect_to profile_path }
      format.text { render partial: 'users/profile', locals: { user: current_user }, formats: [:html] }
    end
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @recommendations = RSpotify::Recommendations.generate(seed_genres: ['hip-hop', 'french'])
  end

  private
  def params_user
    params.require(:user).permit(:job, :photo, :description)
  end
end
