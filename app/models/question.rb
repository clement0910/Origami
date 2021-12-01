class Question < ApplicationRecord
  belongs_to :theme
  has_one_attached :photo
  has_one :tag
  has_one :sentence_bot
end
