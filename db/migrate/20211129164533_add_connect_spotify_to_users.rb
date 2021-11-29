class AddConnectSpotifyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :connect_spotify, :boolean
  end
end
