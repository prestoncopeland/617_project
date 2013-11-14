class RemoveForumsBoardsCommentsConversations < ActiveRecord::Migration
  def change
    drop_table :forums
    drop_table :boards
    drop_table :comments
    drop_table :conversations
  end
end
