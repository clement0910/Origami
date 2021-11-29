class TopGenre < ApplicationRecord
  has_many :genres
  belongs_to :user
end
