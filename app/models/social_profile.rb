class SocialProfile < ActiveRecord::Base
  belongs_to :user

  before_create :create_user

  def create_user
    self.user = User.where(email: self.email).first

    if self.user.blank?
      self.user = User.create(user_attributes)
    else
      update_user_attributes
    end
  end

  def user_attributes
    hash = ['email', 'image', 'name'].map { |v| [v, self.send(v)] }.to_h

    hash
  end

  def update_user_attributes
    user.update_attributes(user_attributes.select { |k, _| user.send(k).blank? } )
  end
end
