# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@ciudadaniaitalia.com'
  layout 'mailer'
end
