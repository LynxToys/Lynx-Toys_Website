class Creation<ActiveRecord::Base
    has_many :picture
    before_destroy :ensure_not_referenced_by_any_picture

    def ensure_not_referenced_by_any_pircture
        if pictures.count.zero?
           return true
        else
            errors[:base]<<"Pictures present"
            return false
        end
    end
	
end



