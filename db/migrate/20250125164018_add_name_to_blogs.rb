class AddNameToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :name, :string
  end
end
