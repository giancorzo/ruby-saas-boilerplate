module UsersHelper
  def bootstrap_color(user)
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

  def header_color(user)
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
end
