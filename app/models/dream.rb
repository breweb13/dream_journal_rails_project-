class Dream < ApplicationRecord
  belongs_to :dream_journal
  validates :name, :date, :description, :reflections, presence: true 
  def dream_journal_attributes=(hash_of_attributes)
    if !hash_of_attributes[:title].blank? 
        self.dream_journal = DreamJournal.find_or_create_by(hash_of_attributes)
    end
  end
end
