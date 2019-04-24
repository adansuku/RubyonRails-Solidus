# Use this initializer to configure the contact mailer.

SolidusContactUs.setup do |config|

  # ==> Mailer Configuration

  # Configure the e-mail address which email notifications should be sent from.  If emails must be sent from a verified email address you may set it here.
  # Example:
  # config.mailer_from = "contact@please-change-me.com"
  config.mailer_from = ENV["ActionMailer_default_options_from"] 

  # Configure the e-mail address which should receive the contact form email notifications.
  config.mailer_bcc = ENV["ActionMailer_default_options_bcc"] 

  # ==> Form Configuration

  # Configure the form to ask for the users name.
  config.require_name = false

  # Configure the form to ask for a subject.
  config.require_subject = false

end
