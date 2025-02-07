class RemoveColumnsFromBlog < ActiveRecord::Migration[8.0]
  def change
    remove_column :blogs, :user_id, :integer
  end
end
