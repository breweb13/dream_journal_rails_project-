class DreamJournal < ApplicationRecord
  has_many :dreams
  belongs_to :user
end
