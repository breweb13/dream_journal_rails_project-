class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.text :reflections
      t.integer :dream_journal_id
      t.integer :feeling_id

      t.timestamps
    end
  end
end
