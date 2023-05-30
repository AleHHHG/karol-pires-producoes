class ApplicationMailer < ActionMailer::Base
  helper :application
  default from: "contato@karolpiresproducoes.com"
  layout "mailer"
end
