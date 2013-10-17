class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

	validates :username, :first_name, :last_name, :email, presence: true

	validates :username, :email, uniqueness: true

	has_secure_password validations: true

	# 			

	# def gmaps4rails_address
	# 	"#{self.street} #{self.city}, #{self.province}"
	# end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # def gmaps4rails_infowindow
  # 	"#{self.full_name}"
  # end

  # def make_username_lower_case
  # 	self.username.downcase!
  # end
end
