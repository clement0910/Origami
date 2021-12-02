class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers
  belongs_to :chatroom, optional: true
  has_one_attached :photo
  has_many :user_artists
  has_many :artists, through: :user_artists
  has_many :genres, -> { distinct }, through: :artists

  validates :first_name, :last_name, :birthday, :gender, :city, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z\u00C0-\u00FF]*\z/, message: "Ce champ n'accepte que les lettres." }
  validates :gender, inclusion: { in: %w[Homme Femme] }
  validates :first_name, :last_name, length: { minimum: 2, message: "Le champ est trop court." }
  validates :photo, attached: true, content_type: %i[png jpg jpeg]
  validates_date :birthday, before: lambda { 18.years.ago },
                            before_message: "must be at least 18 years old"

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
