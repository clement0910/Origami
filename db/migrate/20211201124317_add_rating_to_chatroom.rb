class AddRatingToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :rating, :float
  end
end
