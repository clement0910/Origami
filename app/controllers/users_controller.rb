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

    redirect_to profile_path
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user = current_user
    GetSpotifyData.new(@spotify_user, @user).call
    redirect_to swiper_path
  end

  def in_group?
    @user = User.find(params[:id])
    render json: { in_group: @user.in_group?, users_in_group: @user.chatroom ? @user.chatroom.users : nil }.to_json
  end

  private
  def params_user
    params.require(:user).permit(:job, :photo, :description)
  end
end
