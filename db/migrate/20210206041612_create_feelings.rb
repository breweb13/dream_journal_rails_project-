class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|
      t.string :type
      t.string :description
      t.integer :dream_journals_id

      t.timestamps
    end
  end
end
