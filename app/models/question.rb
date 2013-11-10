class Question < ActiveRecord::Base
	# has_many :taggings, as: :taggable
	# has_many :tags, through: :taggings
	has_many :comments
end
