module UsersHelper
  def bootstrap_color(user)
    if user and user.role
      case user.role.to_sym
      when :interviewer
        return "success"
      when :approver
        return "warning"
      when :hmanager
        return "primary"
      when :admin
        return "danger"
      end
    end
  end

  def header_color(user)
    if user and user.role
      case user.role.to_sym
      when :interviewer
        return "hgreen"
      when :approver
        return "hyellow"
      when :hmanager
        return "hviolet"
      when :admin
        return "hred"
      end
    end
    return ""
  end

  def role_description(role)
    case role
    when "interviewer"
      return "Can only access to assigned interviews"
    when "approver"
      return "Can access to interviews and and move a candidate through the process"
    when "hmanager"
      return "Can access the interview results, scorecards and profiles"
    when "admin"
      return "Account user with full access"
    end
  end
end
