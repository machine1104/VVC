class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,password_length: 8..128

  attr_accessor :remember_token

  before_save do
      email.downcase!
      username.downcase!
  end

  validates :username, presence: true, length: { minimum:5, maximum: 20 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates   :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
  validates :comune, presence: true, length: { maximum: 30 }
  validates :data_nascita, presence: true
  
  validate :is_adult

  validates :password, presence: true, allow_nil: true
  
  # Forgets a user.
  #def forget
      #update_attribute(:remember_digest, nil)
  #end

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