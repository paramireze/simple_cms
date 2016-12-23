class AddContentTypeToSections < ActiveRecord::Migration[5.0]
  def up
    add_column("sections", "content_type", :string, :limit =>55, :after => "content")
  end

  def down
    remove_column("sections", "content_type")
  end
end
