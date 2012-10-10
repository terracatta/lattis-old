class PermittedParams < Struct.new(:params, :current_user)

  # Public: Defines permitted attributes for the user model. Primarily used
  # in a controller to setup the protected attributes.
  #
  # user - A User object abilities will checked against (default: User.new)
  #
  # Examples:
  #   @user.update_attributes(permitted_params.user(@user))
  #
  # Returns a permitted ActionController::Parameters object
  def user(user = User.new)
    params.require(:user).permit(*user_attributes(user))
  end

  # Public: Defines acceptable attributes for the user model based on role.
  #
  # user - A User object abilities will checked against
  #
  # Returns an Array of symbols representing the permitted params
  def user_attributes(user)
    attribtutes = [ :first_name, :last_name, :position, :email ]

    if current_user.can?(:manage, user)
      attribtutes.push(:enabled)
    end

    if current_user.can?(:set_admin, user)
      attribtutes.push(:admin)
    end

    if current_user.can?(:update_password, user)
      attribtutes.push(:password, :password_confirmation, :current_password)
    end

    attribtutes
  end
end
