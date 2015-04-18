class ManageMailer < ApplicationMailer
    default from: "lynxtoystest@gmail.com"

    def sample_email(creation)
        @creation = creation
        mail(:to => "lynxtoystest@gmail.com", :subject => 'Sample Email')
    end
end
