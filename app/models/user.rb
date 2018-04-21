class User < ApplicationRecord
  #validate
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
                      length: { in: 8..20, too_short: "too short", too_long: "too long" }
  validates :password_confirmation, presence: true

  #has_secure_password
  has_secure_password
end
