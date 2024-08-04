class UserMailerPreview < ActionMailer::Preview
  def email_verification_otp_mail
    UserMailer.with(user: User.first).email_verification_otp_mail
  end
end