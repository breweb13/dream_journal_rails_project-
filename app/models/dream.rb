class Dream < ApplicationRecord
  belongs_to :dream_journal
  belongs_to :feeling
  validates :name, :date, :description, :reflections, presence: true 
end
