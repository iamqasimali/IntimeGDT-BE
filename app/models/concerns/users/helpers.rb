module Users::Helpers
  def update_and_send_otp_email
    otp = format('%04d', rand(10_000))
    self.update(confirmation_token: otp)
    UserMailer.email_verification_otp_mail(self, otp).deliver_now
  end


  def create_stripe_client
    client = Stripe::Customer.create({
                                       email: email
                                     })
    update(stripe_client_id: client.id)
    client.id
  end

end