class User < ApplicationRecord
    # Attributes
    has_secure_password

    # Associations
    has_many :tasks, dependent: :destroy

    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, too_short: "は%{count}文字以上で入力してください" }
    validates :password_confirmation, presence: true
end
