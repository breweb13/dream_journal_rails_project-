class DreamJournal < ApplicationRecord
  has_many :dreams
  has_many :feelings
  belongs_to :user
  validates :title, presence: true 
  accepts_nested_attributes_for :dreams, reject_if: :all_blank
  accepts_nested_attributes_for :feelings, reject_if: :all_blank

  def self.most_recent_dream_journal
    DreamJournal.order(created_at: :desc).limit(2)
end
end
