class User < ApplicationRecord
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

    has_secure_password

    validates :password, presence: true, length: { minimum: 8}, allow_nil: true
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
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
