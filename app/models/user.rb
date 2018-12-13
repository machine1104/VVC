class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2],  password_length: 8..128

  attr_accessor :remember_token

  before_save do
      email.downcase!
      username.downcase!
  end

  #validates :username
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates   :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :comune, length: { maximum: 30 }
  #validates :data_nascita, presence: true
  
  validate :is_adult

  #validates :password, allow_nil: true
  
  # Forgets a user.
  #def forget
      #update_attribute(:remember_digest, nil)
  #end

  def self.from_omniauth(auth)
    puts '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    puts auth
    puts '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, provider_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email 
      user.username = auth.info.name
      password = Devise.friendly_token[0,20]
      user.password = password
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      puts '/////////////////////////////////////*************************************++++++++++++++++++'
      user.save!
    end
  end

  private

  def is_adult
      today = Date.today()
      if data_nascita.present?
          age = ((today - data_nascita).to_i)/365
          if age < 18
              errors.add(:data_nascita,"invalid. You must be adult, stronzo")
          else
              true
          end
      end
  end
end