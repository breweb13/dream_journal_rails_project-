class DreamJournal < ApplicationRecord
  belongs_to :user
  has_many :dreams
end
