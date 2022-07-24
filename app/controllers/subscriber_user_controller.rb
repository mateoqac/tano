# frozen_string_literal: true

class SubscriberUserController < ApplicationController
  def create
    @subscriber_user = SubscriberUser.new(subscriber_user_params)

    return unless @subscriber_user.save

    SubscriberUserMailer.subscribe(@subscriber_user).deliver
    redirect_to root_path, info: 'Gracias por suscribirte, en breve recibiras un correo con mas informacion'
  end

  private

  def subscriber_user_params
    params.require(:subscriber_user).permit(:email, :citizenship_checker_id)
  end
end
