# frozen_string_literal: true

class SubscriberUserMailer < ApplicationMailer
  def subscribe(subscriber_user)
    @subscriber_user = subscriber_user

    mail to: @subscriber_user.email, subject: 'Ciudadania Italia - Muchas gracias por suscribirte.'
  end
end
