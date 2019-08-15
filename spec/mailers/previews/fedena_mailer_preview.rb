# Preview all emails at http://localhost:3000/rails/mailers/fedena_mailer
class FedenaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/fedena_mailer/email
   def email
     FedenaMailerMailer.email
   end

end
