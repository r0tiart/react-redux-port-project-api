class Work < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_one :pattern

    has_attached_file :avatar, :default_url => ":style/default.jpg", styles: { medium: "300x300>", thumb: "100x100>" }  	

    validates_attachment_content_type :avatar,   content_type: /\Aimage\/.*\z/

  	validates :title, :description, :category, :user, presence: true

  def avatar_url
      avatar.url(:medium)
  end

  def avatar_full_url
    URI.join(ActionController::Base.asset_host, self.avatar_url)
  end
end
