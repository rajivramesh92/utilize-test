class UserMailer < ApplicationMailer

  def send_mail_to_receiver(recevier, courier)
    @recevier = recevier
    @courier = courier
    mail(to: @recevier.email, subject: "A new courier arrived")
  end
end
