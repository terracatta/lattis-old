class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Gravtastic

  devise :database_authenticatable, :lockable, :recoverable, :trackable,
   :validatable

  has_gravatar secure: true, filetype: :png, size: 256, default: :retro

  before_save :send_welcome_email

  has_many :enrollments
  has_many :stimulation_sessions
  has_many :stimulation_device_sessions
  has_many :stimulations
  has_many :scan_sessions
  has_many :scans
  has_many :exams

  has_many :studies, through: :study_staff
  has_many :study_staff

  belongs_to :staff_position
  belongs_to :role

  # Public: Load/Cache user's abilities object. This is useful so that we can
  # call "can?" and "cannot?" on users directly.
  #
  # Returns an instance variable of the user's abilities in an Ability object
  delegate :can?, :cannot?, :to => :ability
  def ability
    @ability ||= Ability.new(self)
  end

  def to_s
    name
  end

  # Public: Displays a suitable full name for a user
  #
  # Returns a string of the users first name and last name
  def name
    "#{first_name} #{last_name}"
  end

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
