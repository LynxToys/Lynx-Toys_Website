class ManageMailer < ApplicationMailer
    default from: "lynxtoystest@gmail.com"

    def sample_email(creation)
        @creation = creation
        mail(:to => "lynxtoystest@gmail.com", :subject => @creation.name+' was created')
    end
end