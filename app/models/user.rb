class User < ApplicationRecord

    before_save do
        email.downcase!
        username.downcase!
    end

    validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false, scope: :email }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates   :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }
    validates :comune, presence: true, length: { maximum: 30 }
    validates :data_nascita, presence: true
end
