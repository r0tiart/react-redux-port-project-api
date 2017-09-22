class Work < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_one :pattern

	has_attached_file :avatar
  	validates_attachment_content_type :avatar, :default_url => ":style/default.jpg", content_type: /\Aimage\/.*\z/

  	validates :username, presence: true
  	validates :email, uniqueness: true

  def avatar_url
      avatar.url(:medium)
  end

  def avatar_full_url
    URI.join(ActionController::Base.asset_host, self.avatar_url)
  end
end
