class UserConnection < ActiveRecord::Base
	belongs_to :user
	belongs_to :connection, class_name: 'User', foreign_ley: 'connection_id'

	attr_accessible :user, :connection, :user_id, :connection_id
end
