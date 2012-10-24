class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_id, :int
  end
end
