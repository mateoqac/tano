# frozen_string_literal: true

class LoginUserMailer < ApplicationMailer
  default from: LoginUser::MAILER_FROM_EMAIL
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_user_mailer.confirmation.subject
  #
  def confirmation(login_user, confirmation_token)
    @login_user = login_user
    @confirmation_token = confirmation_token

    mail to: @login_user.email, subject: 'Confirma tu cuenta.'
  end
end
