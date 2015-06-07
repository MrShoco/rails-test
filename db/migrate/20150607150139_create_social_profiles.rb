class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :uid
      t.string :provider

      t.timestamps null: false
    end
  end
end
