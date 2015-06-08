class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
