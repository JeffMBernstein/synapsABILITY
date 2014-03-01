class Service < ActiveRecord::Base

	# has_many :taggings, as: :taggable
	# has_many :tags, through: :taggings

	mount_uploader :avatar, AvatarUploader

	validates :name, :phone, :city, :email, presence: true

	validates :name, :email, uniqueness: true

	def full_name
    "#{self.first_name} #{self.last_name}"
  end


end
