class AddUserIds < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :images
    add_column :links, :user_id, :images
  end
end
