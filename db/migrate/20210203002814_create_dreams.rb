class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :title
      t.datetime :date
      t.text :dream
      t.text :reflections
      t.integer :dreamjournals_id

      t.timestamps
    end
  end
end
