class CreateSections < ActiveRecord::Migration[5.0]
  def up
    create_table :sections do |t|
      t.integer "page_id"
      t.string "name"
      t.integer "position"
      t.boolean "visibile", :default => false
      t.text "content"
      t.timestamps
    end
    add_index("sections", "page_id")
  end

  def down
    drop_table :sections
  end
end
