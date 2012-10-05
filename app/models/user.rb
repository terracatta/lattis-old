class User < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :recoverable, :rememberable,
   :trackable, :validatable

  after_save :send_welcome_email

  private

  # Private: Sends a nice welcome email to the user if this is their first
  # time visiting the application. This method is suitable to be used on an
  # AR callback that happens when the user logs in (ex: after_save).
  #
  # Note: Deliver is not called due to a workaround in Delayed Jobs. See
  # https://github.com/collectiveidea/delayed_job#rails-3-mailers for more
  # information.
  #
  # Returns a Delayed::Backend::ActiveRecord::Job if an email was queued
  # otherwise returns false
  def send_welcome_email
    return false if self.sign_in_count != 1

    Notifications.delay(queue: 'mail').welcome(user_id: self.id)
  end
end
