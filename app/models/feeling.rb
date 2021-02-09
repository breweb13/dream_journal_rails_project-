class Feeling < ApplicationRecord
  belongs_to :dream_journal
  validates :description, :type, presence: true 
end
