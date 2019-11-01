class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true
    belongs_to :city, optional: true
    has_many :gossips
    has_many :comments
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

    def remember(remember_token)
        remember_digest = BCrypt::Password.create(remember_token)
        self.update(remember_digest: remember_digest)
    end
end
