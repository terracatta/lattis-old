class User < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :recoverable, :trackable,
   :validatable

  before_save :send_welcome_email

  # Public: Checks if user is enabled and thus allowed to login.
  # This method extends devise's default functionality that is located
  # in devise/lib/devise/models/authenticatable.rb
  #
  # Returns boolean true if the user can login otherwise false
  def active_for_authentication?
    super && enabled?
  end

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
  # otherwise returns nil as to not halt saving
  def send_welcome_email
    unless self.welcomed? && sign_in_count > 0
      self.welcomed = true
      return Notifications.delay(queue: 'mail').welcome(user_id: self.id)
    end

    nil
  end
end
