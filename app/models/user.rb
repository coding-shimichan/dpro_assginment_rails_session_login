class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, presence: true, length: { minimum: 6, too_short: "は%{count}文字以上で入力してください" }
end
