class AddUserIds < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :images, index: true
    add_column :links, :user_id, :images, index: true
  end
end
