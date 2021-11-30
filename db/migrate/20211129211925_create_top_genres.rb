class CreateTopGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :top_genres do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end