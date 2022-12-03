# frozen_string_literal: true

class SubscriberUserMailer < ApplicationMailer
  def subscribe(email)
    mail to: email, subject: 'Ciudadania Italia - Muchas gracias por suscribirte.'
  end
end
