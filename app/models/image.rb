class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :url

  after_destroy :delete_file

  def delete_file
    File.delete(Rails.root.join('app', 'assets', 'images', url))
  end
end
