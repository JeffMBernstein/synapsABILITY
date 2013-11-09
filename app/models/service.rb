class Service < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

	validates :name, :phone, :city, :email, presence: true

	validates :name, :email, uniqueness: true


end
