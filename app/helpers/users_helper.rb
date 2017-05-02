module UsersHelper
  def card_border user
    return current_user == user ? "you-admin-border" :
           user.admin? ? 'user-admin-border' : 'user-normal-border'
  end

  def role_description(role)
    case role
    when "user"
      return "Has access full access except for billing, user-management."
    when "admin"
      return "Account user with full access"
    end
  end
end
