class Cover < ActiveRecord::Base
	belongs_to :creation
	has_attached_file :cover, :path => ":rails_root/public/covers/:id/:filename", :url  => "/covers/:id/:filename"
	do_not_validate_attachment_file_type :cover
end
