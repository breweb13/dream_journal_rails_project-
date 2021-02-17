class User < ApplicationRecord
  has_many :dream_journals
  has_many :dreams, through: :dream_journal
  has_many :feelings, through: :dream_journal

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
