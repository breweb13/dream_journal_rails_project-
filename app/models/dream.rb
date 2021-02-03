class Dream < ApplicationRecord
  belongs_to :dream_journal
  has_many :users, through: :dream_journals
end
