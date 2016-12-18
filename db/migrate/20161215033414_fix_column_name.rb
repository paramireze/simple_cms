class FixColumnName < ActiveRecord::Migration[5.0]
  def up
    rename_column("subjects", "visibile", "visible")
  end

  def down
    rename_column("subjects", "visible", "visibile")
  end
end
