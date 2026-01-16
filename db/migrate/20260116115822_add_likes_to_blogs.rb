class AddLikesToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :likes_count, :integer, default: 0
  end
end
