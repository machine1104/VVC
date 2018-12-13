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

  validates :username , presence: true, length: 5..128, uniqueness: {case_sensitive:false}
  
  # Forgets a user.
  #def forget
      #update_attribute(:remember_digest, nil)
  #end

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, provider_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.nome = auth.info.first_name
      user.cognome = auth.info.last_name
      user.username = auth.info.email.split("@").first
      password = Devise.friendly_token[0,20]
      user.password = password
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.save!
    end
  end
  
end