class ManageMailer < ApplicationMailer
    default from: "lynxtoystest@gmail.com"

    def email_to_manager(creation)
        @creation = creation
        mail(:to => "lynxtoystest@gmail.com", :subject => @creation.name+' was created')
    end
	def email_to_user(creation,action)
        @creation = creation
		@user_mail_address = @creation.email
		@action = action
		if @creation.email != nil
        	mail(:to => @user_mail_address, :subject => @creation.name+' was '+@action)
		end
    end
end
