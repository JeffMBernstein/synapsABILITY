class Tag < ActiveRecord::Base
	has_many :taggings, dependent: :destroy
	
	with_options through: :taggings, source: :taggable do |tag|
		tag.has_many :questions, source_type: "Question"
		tag.has_many :services, source_type: "Service"
	end
end
