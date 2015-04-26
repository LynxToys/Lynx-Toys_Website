class Picture < ActiveRecord::Base
	belongs_to :creation
	has_attached_file :image, :path => ":rails_root/public/images/:id_:filename", :url  => "/images/:id_:filename"
	do_not_validate_attachment_file_type :image	
	validates :creation_id, :presence => true
	validates_associated :creation    
end
