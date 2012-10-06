class PermittedParams < Struct.new(:params, :user)

  #
  #
  #
  def user(user = User.new)
    params.require(:user).permit(*user_attributes(user))
  end

  #
  # Defines acceptable attributes for the user model.
  # We want to allow everything except setting admin rights on yourself
  # if you are not an admin user.
  #
  def user_attributes(user)
    attribtutes = [ :first_name, :last_name, :position, :email ]
    attribtutes << :admin if user.can? :set_admin, user
    attribtutes.push(:password, :password_confirmation, :current_password)

    attribtutes
  end
end
