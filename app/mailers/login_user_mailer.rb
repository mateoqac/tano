# frozen_string_literal: true

class LoginUserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_user_mailer.confirmation.subject
  #
  def confirmation(_login_user_email, confirmation_token)
    @confirmation_token = confirmation_token

    mail to: login_user_email, subject: 'Confirma tu cuenta.'
  end
end
