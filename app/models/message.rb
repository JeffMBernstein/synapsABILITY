class Message < ActiveRecord::Base
	validates :subject, :body, :sender_id, :recipient_id, presence: true
end
