class RemoveOldImageFieldsFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :image_file_name
    remove_column :articles, :image_content_type
    remove_column :articles, :image_file_size
    remove_column :articles, :image_update_at
  end

  def down
    add_column :articles, :image_update_at, :timestamp
    add_column :articles, :image_file_size, :int
    add_column :articles, :image_content_type, :string
    add_column :articles, :image_file_name, :string
  end
end
