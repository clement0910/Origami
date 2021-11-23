class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers

  validates :first_name, :last_name, :birthday, :gender, :city, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "Ce champ n'accepte que les lettres." }
  validates :gender, inclusion: { in: %w[homme femme] }
  validates :first_name, :last_name, length: { minimum: 2 }

  before_save :update_name!

  extend FriendlyId
  friendly_id :username, use: :slugged

  def update_name!
    first_name.capitalize!
    last_name.capitalize!
  end

  private

  def username
    "#{first_name.downcase}#{last_name.downcase[0]}"
  end
end
