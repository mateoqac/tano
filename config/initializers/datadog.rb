require 'ddtrace'
require 'logger'

Datadog.configure do |c|
    c.tracing.instrument :rails, service_name: 'rails-app'
    c.env = 'production'
  c.service = 'billing-api'
  c.version = '2.5.17'
end

logger = Logger.new(STDOUT)
logger.progname = 'rails-app'
logger.formatter  = proc do |severity, datetime, progname, msg|
  "[#{datetime}][#{progname}][#{severity}][#{Datadog::Tracing.log_correlation}] #{msg}\n"
end


logger.warn('This is an untraced operation.')
