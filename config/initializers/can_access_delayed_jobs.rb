class CanAccessDelayedJobs
  def self.matches?(request)
    current_user = request.env['warden'].user
    return false if current_user.blank?
    Ability.new(current_user).can? :manage, DelayedJobWeb
  end
end
