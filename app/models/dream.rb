class Dream < ApplicationRecord
  belongs_to :dream_journal
  validates :name, :date, :description, :reflections, presence: true 
end
