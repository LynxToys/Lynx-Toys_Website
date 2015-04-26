class Cover < ActiveRecord::Base
	belongs_to :creation
	has_attached_file :cover, :path => ":rails_root/public/covers/:id_:filename", :url  => "/covers/:id_:filename"
	do_not_validate_attachment_file_type :cover
end
