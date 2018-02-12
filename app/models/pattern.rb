class Pattern < ApplicationRecord
	belongs_to :work
	has_attached_file :pattern, styles: {thumbnail: "60x60#"}
  	validates_attachment :pattern, content_type: { content_type: "application/pdf" }

   def pattern_full_url
    URI.join(ActionController::Base.asset_host, self.pattern_url)
   end

end
