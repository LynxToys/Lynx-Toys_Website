
#Preview all emails at http://localhost:3000/rails/mailers/manage_mailer
class ManageMailerPreview < ActionMailer::Preview
    def manage_mail_preview
        ManageMailer.sample_email()
    end
end
