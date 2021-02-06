class User < ApplicationRecord
  has_many :dream_journals
  has_many :dreams, through: :dream_journal
  has_many :feelings, through: :dream_journal

  has_secure_password
end
