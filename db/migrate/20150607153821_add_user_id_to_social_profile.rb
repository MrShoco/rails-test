class AddUserIdToSocialProfile < ActiveRecord::Migration
  def change
    add_column :social_profiles, :user_id, :integer, index: true
  end
end
