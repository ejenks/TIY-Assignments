class FixCommentPostIdToPostsId < ActiveRecord::Migration
  def change
  	rename_column :comments, :post_id, :posts_id
  end
end
