class Notifications < ActionMailer::Base
  default from: "noreply@lattis.app"
  #
  # Welcome message sent to a user that is logging in for the first time into
  # the Lattis application.
  #
  def welcome(options={})
    @user = User.find(options[:user_id])
    mail to: @user.email, subject: t('en.notifications.welcome.subject')
  end
end
