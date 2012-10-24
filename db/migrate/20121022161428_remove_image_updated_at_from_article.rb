class RemoveImageUpdatedAtFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :image_updated_at
  end

  def down
    add_column :articles, :image_updated_at, :timestamp
  end
end
