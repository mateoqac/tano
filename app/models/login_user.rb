# frozen_string_literal: true

class LoginUser < ApplicationRecord
  has_secure_password

  MAILER_FROM_EMAIL = 'no-reply@tano.com'
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :state, inclusion: { in: CitizenshipChecker::FINAL_STATES }, if: :should_validate?

  def confirm!
    update_columns(confirmed_at: Time.current)
  end

  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def unconfirmed?
    !confirmed?
  end

  def send_confirmation_email!
    confirmation_token = generate_confirmation_token
    LoginUserMailer.confirmation(self, confirmation_token).deliver_now
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def should_validate?
    state.present?
  end
end
