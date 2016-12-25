class AddPermaLinkToSubject < ActiveRecord::Migration[5.0]
  def up
    add_column("subjects", "permalink", :string, :limit =>55, :after => "visible")
  end

  def down
    remove_column("subjects", "permalink")
  end
end
