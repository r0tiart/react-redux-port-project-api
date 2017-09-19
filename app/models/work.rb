class Work < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_one :pattern


	has_attached_file :avatar
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
