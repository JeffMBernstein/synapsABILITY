class User < ActiveRecord::Base
	has_many :messages
	mount_uploader :avatar, AvatarUploader

	
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
