class RemovePostsFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :pictures, :json
  end
end
