class Feeling < ApplicationRecord
  has_many :dreams
  has_many :dream_journals, through: :dreams

  validates :emotion, presence: true 
end
