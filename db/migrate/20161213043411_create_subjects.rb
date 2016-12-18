class CreateSubjects < ActiveRecord::Migration[5.0]
  def up
    create_table :subjects do |t|
      t.string "name"
      t.integer "position"
      t.boolean "visibile", :default => false
      t.timestamps
    end
  end

  def down
    drop_table :subjects
  end
end
