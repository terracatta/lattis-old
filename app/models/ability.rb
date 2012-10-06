class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    else
        can :read, :all
        can [:update, :change_password, :update_password], User, id: user.id
        cannot :set_admin, User
    end
  end
end
