class RemoveColumnFromBlog < ActiveRecord::Migration[8.0]
  def change
    remove_column :blogs, :name, :string
  end
end
