class DreamJournal < ApplicationRecord
  has_many :dreams
  has_many :feelings
  belongs_to :user
  validates :title, presence: true 
 

  def self.most_recent_dream_journal
    DreamJournal.order(created_at: :desc).limit(2)
end
end
