class Feeling < ApplicationRecord
  belongs_to :dream_journal, optional: true
  
end
