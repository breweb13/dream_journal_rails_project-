class User < ApplicationRecord
  has_many :dream_journals
  has_many :dreams, through: :dream_journal
end
