class Contact < MailForm::Base
  attribute :nome, validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :messaggio,   validate: true

  def headers
    {
      subject: 'Form Segnalazione',
      to: 'vienivedicompra@gmail.com',
      from: %("#{nome}" <#{email}>)
    }
  end
end
