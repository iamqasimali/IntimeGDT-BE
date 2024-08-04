class UserMailer < ApplicationMailer

  def email_verification_otp_mail(user, otp_code)
    @user = user
    @otp_code = otp_code
    mail( :to => @user.email,
          :subject => I18n.t('user_mailer.email_verification_otp_mail.subject'))
  end
end
