class Message < ActiveRecord::Base
	belongs_to :user

	validates :subject, :body, :sender_id, presence: true
end
