class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :question, uniqueness: { scope: :user }
end
