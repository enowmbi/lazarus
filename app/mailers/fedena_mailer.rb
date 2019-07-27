class FedenaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.fedena_mailer.email.subject
  #
  def email(sender,recipients, subject, message)
    recipient_emails = (recipients.class == String) ? recipients.gsub(' ','').split(',').compact : recipients.compact
    setup_email(sender, recipient_emails, subject, message)
  end

  protected
  def setup_email(sender, emails, subject, message)
    @from = sender
    @recipients = emails
    @subject = subject
    @sent_on = Time.now
    @body['message'] = message
  end

end
