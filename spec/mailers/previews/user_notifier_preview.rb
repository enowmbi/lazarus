# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/forgot_password
  def forgot_password
    UserNotifierMailer.forgot_password
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/get_domain
  def get_domain
    UserNotifierMailer.get_domain
  end

end
