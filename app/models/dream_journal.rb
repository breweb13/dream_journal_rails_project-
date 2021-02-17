class DreamJournal < ApplicationRecord
  has_many :dreams
  has_many :feelings, through: :dreams
  belongs_to :user
  validates :title, presence: true 
 

  def self.most_recent_dream_journal
    DreamJournal.order(created_at: :desc)
  end
end
