# Load the Rails application.
#
ActionMailer::Base.smtp_settings = {
  :user_name => 'adns',
  :password => 'angie1994',
  :domain => 'http://thawing-everglades-7104.herokuapp.com/',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
