class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|
      t.string :emotion
      t.integer :dream_journal_id,:default => 0

      t.timestamps
    end
  end
end
