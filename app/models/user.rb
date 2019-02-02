class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook],  password_length: 8..128

  attr_accessor :remember_token

  before_save do
    email.downcase!
    username.downcase!
  end

  has_many :announcements, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy, through: :announcements
  has_many :answers, dependent: :destroy, through: :announcements


  validates :username , presence: true, length: 5..128, uniqueness: { case_sensitive:false }

  def self.from_omniauth(auth)   
    where(provider: auth.provider, provider_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.nome = auth.info.first_name
      user.cognome = auth.info.last_name
      user.username = auth.info.email.split("@").first
      user.image = auth.info.image
      password = Devise.friendly_token[0,20]
      user.password = password
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      if auth.provider == 'google_oauth2'
        user.refresh_token = auth.credentials.refresh_token
      end
    end
  end

  def favorite(announcement)
    favorites.find_or_create_by(announcement: announcement)
  end

  def unfavorite(announcement)
    favorites.where(announcement: announcement).destroy_all
    announcement.reload
  end

  def favorited?(announcement)
    favorites.find_by(announcement_id: announcement.id).present?
  end
end
