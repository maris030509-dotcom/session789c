class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      to: ENV['GMAIL_USERNAME'],      # 送信先（自分の Gmail）
      subject: "お問い合わせが届きました"
    )
  end
end
