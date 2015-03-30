class Picture < ActiveRecord::Base
	belongs_to :creation, {:foreign_key => "creation_id"}  
	    
end
